using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Npgsql;
using System.Data;

namespace CountryLiving
{
    public class SqlManager
    {
        //make the connection string to database
        private static string constring = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
        private static NpgsqlConnection con = new NpgsqlConnection(constring); //the sql connection 
        
        public void SqlConnection(bool openorclose)//this method is to open and close the connection 
        {
            if (openorclose)
            {

                con.Open();
            }

            else
            {
                con.Close();
            }

        }
        public void InsertPerson(string emailpar, string fullname, string addresspar, int zippar, int phonenrpar, string passwordpar)
        {
            //Opens the connection to the database
            SqlConnection(true);
            //String that defines the query to a function with parameters
            var sql = "INSERT INTO public.customer(pk_email, fullname, \"address\", zip_code, phone_nr, password) VALUES(@email, @name, @address, @zip, @mobil, @password)";
            //Sets it to a Npqsql command
            var cmd = new NpgsqlCommand(sql, con);

            //Sets all the parameter values
            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("name", fullname);
            cmd.Parameters.AddWithValue("address", addresspar);
            cmd.Parameters.AddWithValue("zip", zippar);
            cmd.Parameters.AddWithValue("mobil", phonenrpar);
            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("password", passwordpar);

            cmd.Prepare();
            //Runs the query and returns nothing
            cmd.ExecuteNonQuery();
            SqlConnection(false);

        }

        /// <summary>
        ///  Checks if customer exists
        /// </summary>
        public int GetCustomers(string emailpar, string passwordpar)
        {
            SqlConnection(true);
            var sql = "SELECT COUNT(*) FROM public.customer WHERE pk_email = @email AND password = @password ";
            var cmd = new NpgsqlCommand(sql, con);

            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("password", passwordpar);
            int output = Convert.ToInt32(cmd.ExecuteScalar());
            SqlConnection(false);
            return output;


        }

        /// <summary>
        ///  Sends a query to sql and returns the fullname of requested email
        /// </summary>
        public string GetCustomerName(string email)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT fullname FROM public.customer WHERE pk_email = @email";
            var cmd = new NpgsqlCommand(sql, con);

            cmd.Parameters.AddWithValue("email", email);

            cmd.Prepare();
            string output = cmd.ExecuteReader().ToString();
            SqlConnection(false);
            return output;
        }

        /// <summary>
        ///   Sends query to sql that returns available rooms depending on the date and services
        /// </summary>
        /// <returns> all available rooms from request </returns>
        public NpgsqlCommand SelectAvailableRooms(string datein, string dateout, string par1, string par2, string par3, string par4, string par5, string par6, string par7)
        {
            SqlConnection(false);
            SqlConnection(true);
            //String that defines the query to a function with parameters
            var sql = "SELECT * FROM public.fp_getavailableroom(@datein, @dateout, @par1, @par2, @par3, @par4, @par5, @par6, @par7)";
            var cmd = new NpgsqlCommand(sql, con);

            //Sets all the parameter values in the command
            cmd.Parameters.AddWithValue("datein", datein);
            cmd.Parameters.AddWithValue("dateout", dateout);
            cmd.Parameters.AddWithValue("par1", par1);
            cmd.Parameters.AddWithValue("par2", par2);
            cmd.Parameters.AddWithValue("par3", par3);
            cmd.Parameters.AddWithValue("par4", par4);
            cmd.Parameters.AddWithValue("par5", par5);
            cmd.Parameters.AddWithValue("par6", par6);
            cmd.Parameters.AddWithValue("par7", par7);


            return cmd;
        }

        /// <summary>
        ///  Creates the reservation and inserts it into sql 
        /// </summary>
        public void CreateReservationSQL(Reservation res)
        {
            
            SqlConnection(false);
            SqlConnection(true);
            //string that defines the query to a function with parameters
            var sql = "CALL public.sp_createreservation(@roomid, @customermail, @datein, @dateout)";
            var cmd = new NpgsqlCommand(sql, con);

            //Sets all the parameters to the reservation's values
            cmd.Parameters.AddWithValue("@roomid", res.RoomId);
            cmd.Parameters.AddWithValue("@customermail", res.CustomerMail);
            cmd.Parameters.Add("@datein", NpgsqlTypes.NpgsqlDbType.Date);
            cmd.Parameters.Add("@dateout", NpgsqlTypes.NpgsqlDbType.Date);
            cmd.Parameters["@datein"].Value = res.From;
            cmd.Parameters["@dateout"].Value = res.To;

            cmd.ExecuteReader();

            SqlConnection(false);
        }


        /// <summary>
        ///  Gets all the information about the user and the booking the user is currently making
        /// </summary>
        public NpgsqlCommand Bookinformation(DateTime checkin, DateTime checkout, string customermail, int roomidinput)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM fp_get_alluserdata_roomdata(CAST(@checkin AS DATE), CAST(@checkout AS DATE), @customermail, @roomidinput)";
            var cmd = new NpgsqlCommand(sql, con);

            //NpgsqlParameter parcheckin= new NpgsqlParameter(":checkin", NpgsqlTypes.NpgsqlDbType.Date);
            //parcheckin.Value = DateTime.Now;

            cmd.Parameters.AddWithValue("checkin", checkin);
            cmd.Parameters.AddWithValue("checkout", checkout);
            cmd.Parameters.AddWithValue("customermail", customermail);
            cmd.Parameters.AddWithValue("roomidinput", roomidinput);

            return cmd;
           
        }

        /// <summary>
        ///  Gets the information about the room
        /// </summary>
        public NpgsqlCommand Roominformation(int roomidinput, DateTime checkin, DateTime checkout)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM fp_get_roomdata( @roomidinput, CAST(@checkin AS DATE), CAST(@checkout AS DATE) )";
            var cmd = new NpgsqlCommand(sql, con);

            //NpgsqlParameter parcheckin= new NpgsqlParameter(":checkin", NpgsqlTypes.NpgsqlDbType.Date);
            //parcheckin.Value = DateTime.Now;

            cmd.Parameters.AddWithValue("roomidinput", roomidinput);
            cmd.Parameters.AddWithValue("checkin", checkin);
            cmd.Parameters.AddWithValue("checkout", checkout);

            return cmd;

        }

        /// <summary>
        ///  Gets the information about the customer
        /// </summary>
        public NpgsqlCommand GetCustomerinfo(string emailinput)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM fp_get_customerinfo(@email)";
            var cmd = new NpgsqlCommand(sql, con);
            cmd.Parameters.AddWithValue("email", emailinput);

            return cmd;
        }

        /// <summary>
        ///  (Used in the WPF)
        ///  Gets all the reservations
        /// </summary>
        public NpgsqlCommand SeeAllReservations()
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM booking";
            var cmd = new NpgsqlCommand(sql, con);

            return cmd;
        }

        /// <summary>
        ///  (Used in the WPF)
        ///  Gets the information about the room
        /// </summary>
        public NpgsqlCommand GetRoom(string roomid)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = $"SELECT * FROM room WHERE pk_room_id = {roomid}";
            var cmd = new NpgsqlCommand(sql, con);

            return cmd;
        }
       
    }
}
