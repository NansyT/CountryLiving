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

    }
}
