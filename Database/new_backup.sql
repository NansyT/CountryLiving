--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-06-19 10:57:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE landlyst;
--
-- TOC entry 2875 (class 1262 OID 16393)
-- Name: landlyst; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE landlyst WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Danish_Denmark.1252' LC_CTYPE = 'Danish_Denmark.1252';


ALTER DATABASE landlyst OWNER TO postgres;

\connect landlyst

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16773)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    pk_reservation_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    fk_room_id integer,
    fk_customer_email character varying,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 16773)
-- Dependencies: 206
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.booking (pk_reservation_id, fk_room_id, fk_customer_email, check_in_date, check_out_date) VALUES ('c077a75a-3e71-42cc-948e-dd2b6d208558', 100, 'test', '2020-06-11', '2020-06-18');
INSERT INTO public.booking (pk_reservation_id, fk_room_id, fk_customer_email, check_in_date, check_out_date) VALUES ('99d95d45-aaf8-4cff-a911-2977132929e6', 100, 'test', '2020-06-06', '2020-06-10');
INSERT INTO public.booking (pk_reservation_id, fk_room_id, fk_customer_email, check_in_date, check_out_date) VALUES ('711a0fa5-c01d-45b4-9bbf-50ddf1c03870', 105, 'test', '2020-06-17', '2020-06-30');
INSERT INTO public.booking (pk_reservation_id, fk_room_id, fk_customer_email, check_in_date, check_out_date) VALUES ('3f90dd73-43a6-4f25-af7e-074ce2c41dbd', 504, 'test', '2020-06-19', '2020-06-30');


--
-- TOC entry 2739 (class 2606 OID 16781)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (pk_reservation_id);


--
-- TOC entry 2742 (class 2620 OID 24743)
-- Name: booking tg_booking_changes; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tg_booking_changes AFTER INSERT OR DELETE ON public.booking FOR EACH ROW EXECUTE FUNCTION public.tg_fp_log_booking_changes();


--
-- TOC entry 2741 (class 2606 OID 16787)
-- Name: booking booking_fk_customer_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_fk_customer_email_fkey FOREIGN KEY (fk_customer_email) REFERENCES public.customer(pk_email);


--
-- TOC entry 2740 (class 2606 OID 16782)
-- Name: booking booking_fk_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_fk_room_id_fkey FOREIGN KEY (fk_room_id) REFERENCES public.room(pk_room_id);


-- Completed on 2020-06-19 10:57:55

--
-- PostgreSQL database dump complete
--

