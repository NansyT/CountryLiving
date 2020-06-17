using System;
using System.Collections.Generic;
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
            NpgsqlDataReader rdr = GetCustomerinfo(email).ExecuteReader();
            Customer customer = new Customer(email, rdr.GetString(1), rdr.GetString(2), rdr.GetInt32(3), rdr.GetInt32(4));
            return customer;
            
        }
    }
}
