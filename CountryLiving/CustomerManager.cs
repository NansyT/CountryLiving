using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class CustomerManager : SqlManager
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
    }
}
