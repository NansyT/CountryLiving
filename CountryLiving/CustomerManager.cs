using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class CustomerManager
    {

        private void CreateCustomer(string name, string address, int zipcode, string city, int phonenumber, string email, string password)
        {
            Customer customer = new Customer(name, address, zipcode, city, phonenumber, email, password);

        }
    }
}
