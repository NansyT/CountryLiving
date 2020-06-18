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
                name = rdr[0].ToString();
                address = rdr[1].ToString();
                zipcode = Convert.ToInt32(rdr[2]);
                phone = Convert.ToInt32(rdr[3]);
            }
            Debug.WriteLine("{0}\n{1}\n{2}\n{3}\n{4}", email, name, address, zipcode, phone);
              Customer customer = new Customer(email, name, address, zipcode, phone);
                return customer;

            
            
        }
    }
}
