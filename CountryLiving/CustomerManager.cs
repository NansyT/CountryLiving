using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace CountryLiving
{
    public class CustomerManager : SqlManager
    {

        private void CreateCustomer(string name, string address, int zipcode, int phonenumber, string email, string password)
        {
            Customer customer = new Customer(email, name, address, zipcode, phonenumber, password);
            InsertPerson(customer.Email, customer.Name, customer.Address, customer.Zipcode, customer.Phonenumber, customer.Password);
        }
        public void CheckCustomer(string email, string password)
        {
            GetCustomers(email, password);
        }
        public Customer CreateCustomerObjFromSQL(string email)
        {
            string name = null;
            string address = null;
            int zipcode = 0;
            int phone = 0;
            NpgsqlDataReader rdr = GetCustomerinfo(email).ExecuteReader();
            while(rdr.Read()) //for hver række der er i query 
            {
                name = rdr.GetString(1);
                address = rdr.GetString(2);
                zipcode = rdr.GetInt32(3);
                phone = rdr.GetInt32(4);
            }
            Debug.WriteLine(email, name, address, zipcode, phone);
              Customer customer = new Customer(email, name, address, zipcode, phone);
                return customer;

            
            
        }
        public void TEST(string email)
        {
            GetCustomerinfo(email).ExecuteReader();
            string name = null;
            string address = null;
            int zipcode = 0;
            int phone = 0;

            NpgsqlDataReader rdr = GetCustomerinfo(email).ExecuteReader();
            while (rdr.Read()) //for hver række der er i query 
            {
                name = rdr["fullname"].ToString();
                address = rdr["address"].ToString();
                zipcode = Convert.ToInt32(rdr["zipcode"]);
                phone = Convert.ToInt32(rdr["phone"]);
                Debug.WriteLine("{0}\n", rdr[0]);
            }
            Debug.WriteLine(email, name, address, zipcode, phone);


        }
    }
}
