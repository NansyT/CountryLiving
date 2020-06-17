using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Npgsql;

namespace CountryLiving
{
    public class SqlManager
    {
        private static string constring = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
        private static NpgsqlConnection con = new NpgsqlConnection(constring);
        
        public void SqlConnection(bool openorclose)
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
            SqlConnection(true);
            var sql = "INSERT INTO public.customer(pk_email, fullname, \"address\", zip_code, phone_nr, password) VALUES(@email, @name, @address, @zip, @mobil, @password)";
            var cmd = new NpgsqlCommand(sql, con);

            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("name", fullname);
            cmd.Parameters.AddWithValue("address", addresspar);
            cmd.Parameters.AddWithValue("zip", zippar);
            cmd.Parameters.AddWithValue("mobil", phonenrpar);
            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("password", passwordpar);

            cmd.Prepare();
            cmd.ExecuteNonQuery();
            SqlConnection(false);

        }
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
        public NpgsqlCommand SelectAvailableRooms(string datein, string dateout, string par1, string par2, string par3, string par4, string par5, string par6, string par7)
        {
            Debug.WriteLine(datein, dateout, par1, par2, par3, par4, par5, par6, par7);
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM public.fc_getavailableroom(@datein, @dateout, @par1, @par2, @par3, @par4, @par5, @par6, @par7)";
            var cmd = new NpgsqlCommand(sql, con);

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


        public string GetBasePrice(string RoomID)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = $"SELECT price FROM room WHERE pk_room_id = {RoomID}";
            var cmd = new NpgsqlCommand(sql, con);
            string output = cmd.ExecuteScalar().ToString();
            return output;
        }
        public NpgsqlCommand CreateReservation(Reservation res)
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "CALL public.pr_createreservation(@roomid, @customermail, @datein, @dateout)";
            var cmd = new NpgsqlCommand(sql, con);

            cmd.Parameters.AddWithValue("roomid", res.RoomId);
            cmd.Parameters.AddWithValue("customermail", res.CustomerMail );
            cmd.Parameters.AddWithValue("datein", res.To);
            cmd.Parameters.AddWithValue("dateout", res.From);

            return cmd;
        }
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
        public NpgsqlDataReader SeeAllBookings()
        {
            SqlConnection(false);
            SqlConnection(true);
            var sql = "SELECT * FROM booking";
            var cmd = new NpgsqlCommand(sql, con);

            return cmd.ExecuteReader();
        }
    }
}
