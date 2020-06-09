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
        public void InsertPerson(string namepar, string addresspar, int zippar, string citypar, int phonenrpar, string emailpar, string passwordpar) 
        {
            SqlConnection(true);
            var sql = "INSERT INTO public.persons(\"Name\", \"Address\", zipcode, city, mobilenr, email, password) VALUES(@name, @address, @zip, @city, @mobil, @email, @password)";
            var cmd = new NpgsqlCommand(sql, con);

            cmd.Parameters.AddWithValue("name", namepar);
            cmd.Parameters.AddWithValue("address", addresspar);
            cmd.Parameters.AddWithValue("zip", zippar);
            cmd.Parameters.AddWithValue("city", citypar);
            cmd.Parameters.AddWithValue("mobil", phonenrpar);
            cmd.Parameters.AddWithValue("email", emailpar);
            cmd.Parameters.AddWithValue("password", passwordpar);

            cmd.Prepare();
            cmd.ExecuteNonQuery();
            SqlConnection(false);

        }


    }
}
