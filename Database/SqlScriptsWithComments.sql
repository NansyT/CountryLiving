/* 
Create an trigger 
WHEN delete or row is insert 
THEN execute a procedure for every row
*/
CREATE TRIGGER tg_booking_changes
  AFTER DELETE OR INSERT --after insert or delete this trigger should
  ON booking
  FOR EACH ROW
  EXECUTE PROCEDURE tg_fp_log_booking_changes()
;

/*
Create the function to the trigger to insert an row in booking_audits database
*/
CREATE OR REPLACE FUNCTION tg_fp_log_booking_changes()
  RETURNS trigger AS
$BODY$
BEGIN
--TG_OP is an function to check which operation the trigger do
	IF (TG_OP = 'DELETE') THEN
            INSERT INTO booking_audits SELECT
			uuid_generate_v4(), --New change id
			OLD.*,
			now(), --the action time and date
			'DEL'; --the action is DEL because an rom is DELETED
            RETURN OLD;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO booking_audits SELECT
			uuid_generate_v4(), --New change id
			NEW.*,
			now(), --the action time and date
			'INS'; --the action is INS because an room is INSERT
            RETURN NEW;
        END IF;
        RETURN NULL; -- if nothing of them is true then return nothing
	RETURN NEW;
END;
$BODY$
LANGUAGE 'plpgsql';

/*
  Get all avaliable rooms where the service on the room and no bookings on the room
*/
-- FUNCTION: public.fp_getavailableroom(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.fp_getavailableroom(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.fp_getavailableroom(
	datein character varying,
	dateout character varying,
	par1 character varying,
	par2 character varying,
	par3 character varying,
	par4 character varying,
	par5 character varying,
	par6 character varying,
	par7 character varying)
    RETURNS TABLE(roomid integer, services character varying, priceday numeric, totalprice numeric) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
    
AS $BODY$
BEGIN
	RETURN QUERY
	SELECT RoomFunc.RoomID AS roomid, 
		CAST(string_agg(description::VARCHAR, ', ') AS VARCHAR) AS Service,
		CAST(room.price + SUM(additional_services.price) as NUMERIC(18,2)) AS pricepday,
		CAST(totalpricetable AS NUMERIC(18,2))  AS totalprice --CAST the column
	FROM fp_getroomid(datein, dateout, par1, par2, par3, par4, par5, par6, par7) AS RoomFunc --function to get avaliable room id´s
	JOIN room
	ON room.pk_room_id = RoomFunc.RoomID --joining on room id´s
	JOIN public.roomservices
	ON roomservices.pk_fk_room_id = room.pk_room_id
	JOIN public.additional_services
	ON additional_services.pk_supplement_id = roomservices.pk_fk_supplement_id
	CROSS JOIN fp_CalculateTotalPrice(CAST(datein as date), CAST(dateout as date), RoomFunc.RoomID) AS totalpricetable -- cross join because there is nothing to join on 
	GROUP BY RoomFunc.RoomID, room.price, totalpricetable.totalpricetable ; --group is need because the SUM column
END; $BODY$;

ALTER FUNCTION public.fp_getavailableroom(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
    OWNER TO postgres;

/*
  procedure to insert bookings in booking table
*/
-- PROCEDURE: public.sp_createreservation(integer, character varying, date, date)

-- DROP PROCEDURE public.sp_createreservation(integer, character varying, date, date);

CREATE OR REPLACE PROCEDURE public.sp_createreservation(
	roomid integer,
	customermail character varying,
	datein date,
	dateout date)
LANGUAGE 'plpgsql'

AS $BODY$
DECLARE 
	room INT;
BEGIN
	SELECT * 
		INTO room
	FROM Fp_CheckIfRoomIsAvailable(datein, dateout, roomID);
    IF (room > 0 )
		THEN RAISE NOTICE 'No rooms';
	ELSE 
		INSERT INTO booking(fk_room_id, fk_customer_email, check_in_date, check_out_date) VALUES(roomID, customermail, datein, dateout);
		END IF;
    COMMIT;
END;
$BODY$;

/*
Make the services to one string seperated with ,
*/
-- FUNCTION: public.fp_getserviceasstring()

-- DROP FUNCTION public.fp_getserviceasstring();

CREATE OR REPLACE FUNCTION public.fp_getserviceasstring(
	)
    RETURNS TABLE(servicestr character varying, pk_room_id integer) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
    
AS $BODY$
BEGIN
	RETURN QUERY SELECT
		CAST(string_agg(description::VARCHAR, ', ') AS VARCHAR) AS Serviceroom, --its an function to add all services to an string
		room.pk_room_id AS roomid
	FROM room
	JOIN public.roomservices
	ON roomservices.pk_fk_room_id = room.pk_room_id
	JOIN public.additional_services
	ON additional_services.pk_supplement_id = roomservices.pk_fk_supplement_id
	GROUP BY room.pk_room_id, room.price ; 
END; $BODY$;

ALTER FUNCTION public.fp_getserviceasstring()
    OWNER TO postgres;


/*
get both customer data and roomdata
*/
-- FUNCTION: public.fp_get_alluserdata_roomdata(date, date, character varying, integer)

-- DROP FUNCTION public.fp_get_alluserdata_roomdata(date, date, character varying, integer);

CREATE OR REPLACE FUNCTION public.fp_get_alluserdata_roomdata(
	checkin date,
	checkout date,
	customermail character varying,
	roomidinput integer)
    RETURNS TABLE(roomid integer, services character varying, email character varying, fullname character varying, address character varying, zipcode integer, phone integer, city character varying, pricepday numeric, indate date, outdate date, totalnights integer, totalprice numeric) 
    LANGUAGE 'plpgsql'

    COST 100 
    VOLATILE 
    ROWS 1000
    
AS $BODY$
BEGIN
	RETURN QUERY 
	SELECT roomidinput,
		roomdata.servicestr,
		customer.pk_email, 
		customer.fullname,
		customer.address,
		customer.zip_code,
		customer.phone_nr,
		citycode.city,
		roomdata.pricepday,
		checkin,
		checkout,
		roomdata.totalnights,
		roomdata.totalprice
	FROM customer
	LEFT JOIN citycode
		ON citycode.pk_zip_code = customer.zip_code
	LEFT JOIN fp_get_roomdata(roomidinput, checkin, checkout) AS roomdata
		ON roomdata.roomid = roomidinput
	WHERE customer.pk_email = customermail;
END; $BODY$;

ALTER FUNCTION public.fp_get_alluserdata_roomdata(date, date, character varying, integer)
    OWNER TO postgres;


/*
check if available rooms before booking
*/
-- FUNCTION: public.fc_checkifroomisavailable(date, date, integer)

-- DROP FUNCTION public.fc_checkifroomisavailable(date, date, integer);

CREATE OR REPLACE FUNCTION public.fp_checkifroomisavailable(
	datein date,
	dateout date,
	roomid integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    
AS $BODY$
DECLARE 
	result INTEGER;
BEGIN
	 SELECT INTO result CAST(COUNT(1) AS INT) 
	 FROM booking
	 WHERE fk_room_id = roomid
	 	AND (( datein > check_in_date and datein < check_out_date) --check the room is not already booked 
	 		OR ( dateout > check_in_date and dateout <check_out_date));
	RETURN result;
END; $BODY$;


/*
Get all roomdata 
*/
-- FUNCTION: public.fp_get_roomdata(integer, date, date)

-- DROP FUNCTION public.fp_get_roomdata(integer, date, date);

CREATE OR REPLACE FUNCTION public.fp_get_roomdata(
	roomidinput integer,
	datein date,
	dateout date)
    RETURNS TABLE(roomid integer, servicestr character varying, pricepday numeric, totalnights integer, totalprice numeric) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
    
AS $BODY$
BEGIN
	RETURN QUERY SELECT servicestr.pk_room_id,
		servicestr.servicestr,
		CAST(room.price + SUM(additional_services.price) as NUMERIC(18,2)) AS pricepday,
		CAST((dateout::date) - (datein::date) AS int) AS totalnights,
		CAST(totalpricetable AS NUMERIC(18,2))  AS totalprice
	FROM room
	JOIN public.fp_getserviceasstring() AS servicestr
		ON servicestr.pk_room_id = roomidinput
	JOIN public.roomservices
		ON roomservices.pk_fk_room_id = room.pk_room_id
	JOIN public.additional_services
		ON additional_services.pk_supplement_id = roomservices.pk_fk_supplement_id
	CROSS JOIN Fp_CalculateTotalPrice(CAST(datein as date), CAST(dateout as date), roomidinput) AS totalpricetable
	WHERE room.pk_room_id = roomidinput
	GROUP BY room.price, servicestr.pk_room_id, servicestr.servicestr, totalnights, totalprice;
END; $BODY$;

ALTER FUNCTION public.fp_get_roomdata(integer, date, date)
    OWNER TO postgres;


/*
get all customer information to view on page
*/
-- FUNCTION: public.testpis(character varying)

-- DROP FUNCTION public.testpis(character varying);

CREATE OR REPLACE FUNCTION public.fp_get_customerinfo(
	emailpar character varying)
    RETURNS TABLE(fullname character varying, address character varying, zipcode integer, phone integer) 
    LANGUAGE 'plpgsql'
    
AS $BODY$
BEGIN
	RETURN QUERY SELECT 
		customer.fullname, 
		customer.address, 
		customer.zip_code, 
		customer.phone_nr 
	FROM customer 
	WHERE pk_email = emailpar ;
END; $BODY$;

/*
calculate the total price calculated with both 10% and services
*/
-- FUNCTION: public.fc_calculatetotalprice(date, date, integer)

-- DROP FUNCTION public.fp_calculatetotalprice(date, date, integer);

CREATE OR REPLACE FUNCTION public.fp_calculatetotalprice(
	datein date,
	dateout date,
	roomid integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    
AS $BODY$
DECLARE -- der bliver declaret 2 værdier som vi har brug for til udregningen
	price NUMERIC(18,2);
	result NUMERIC(18,2);
BEGIN

-- Udregningen forgår sammentid med vi sætter price til værdien
	SELECT 
	--det første cast er til at konvertere hele resultatet til NUMERIC
	--Det næste cast er til at konvertere dato forskellen til en int for at kunne gange det med prisen
	INTO price CAST((room.price + SUM(additional_services.price)) * CAST((dateout::date) - (datein::date) AS INT) AS NUMERIC(18,2))
	FROM room
	--alle joines er til at få priserne på tillægsydelserne 
	JOIN public.roomservices
	ON roomservices.pk_fk_room_id = room.pk_room_id
	JOIN public.additional_services
	ON additional_services.pk_supplement_id = roomservices.pk_fk_supplement_id
	WHERE room.pk_room_id = roomid
	--Der er nød til at blive grupperet da vi laver en SUM
	GROUP BY room.price;
	--Hvis perioden for bookingen er 7 dage eller mere er der 10% på  
	CASE
		WHEN CAST((dateout::date) - (datein::date) AS INT) >= 7 THEN 
			--udregner prisen med procent
			result = CAST(price -( ( (price)/100)*10) AS NUMERIC(18,2));
		ELSE 
			result = price;
			  END CASE ;
	RETURN result;
	 END; $BODY$;

ALTER FUNCTION public.fc_calculatetotalprice(date, date, integer)
    OWNER TO postgres;


/*
Get roomID to view avaliable rooms 
*/
-- FUNCTION: public.fc_getroomid(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.fc_getroomid(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.fp_getroomid(
	datein character varying,
	dateout character varying,
	par1 character varying,
	par2 character varying,
	par3 character varying,
	par4 character varying,
	par5 character varying,
	par6 character varying,
	par7 character varying)
    RETURNS TABLE(roomid integer) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
    
AS $BODY$
BEGIN
RETURN QUERY SELECT CAST(room.pk_room_id as INTEGER)
	FROM room
	LEFT JOIN public.booking
		ON fk_room_id = pk_room_id
	JOIN public.roomservices
		ON roomservices.pk_fk_room_id = room.pk_room_id
	JOIN public.additional_services
		ON additional_services.pk_supplement_id = roomservices.pk_fk_supplement_id
	JOIN fp_getServiceasString() AS serviceFunc --make an string of all services
		ON serviceFunc.pk_room_id = room.pk_room_id
		--COALESCE is IFNULL in SSMS WHEN booking.check_in_date IS NULL then use '1900-01-01'
	WHERE ( (booking.check_out_date IS NULL AND COALESCE(booking.check_in_date IS NULL )) --return true when 
		OR (CAST(dateout as date) > COALESCE(booking.check_out_date, '9999-12-31')
		   	AND CAST(datein as date) >= COALESCE(booking.check_out_date, '9999-12-31'))
			OR (CAST(dateout as date) <= COALESCE(booking.check_in_date, '1900-01-01')
		   	AND CAST(datein as date) < COALESCE(booking.check_in_date, '1900-01-01'))
			)--when check out us more or = else false
		AND (serviceFunc.servicestr LIKE ('%' || par1 || '%') -- '%' || par1 || '%' this is the way to insert an parameter in a like 
		AND serviceFunc.servicestr LIKE ('%' || par2 || '%')
		AND serviceFunc.servicestr LIKE ('%' || par3 || '%')
		AND serviceFunc.servicestr LIKE ('%' || par4 || '%')
		AND serviceFunc.servicestr LIKE ('%' || par5 || '%')
		AND serviceFunc.servicestr LIKE ('%' || par6 || '%')
		AND serviceFunc.servicestr LIKE ('%' || par7 || '%'))
		GROUP BY room.pk_room_id
;
	
END; $BODY$;

ALTER FUNCTION public.fc_getroomid(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
    OWNER TO postgres;
