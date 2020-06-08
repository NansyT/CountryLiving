using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

            cmd.Prepare();
            int output = Convert.ToInt32(cmd.ExecuteScalar());
            SqlConnection(false);
            return output;


        }
    }
}
