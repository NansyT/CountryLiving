using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class Customer
    {
        private string name;
        private string address;
        private int zipcode;
        private string city;
        private int phonenumber;
        private string email;
        private string password;

        public string Name
        {
            get { return name; }
            private set { name = value; }
        }
        public string Address
        {
            get { return address; }
            private set { address = value; }
        }
        public int Zipcode
        {
            get { return zipcode; }
            private set { zipcode = value; }
        }
        public string City
        {
            get { return city; }
            private set { city = value; }
        }
        public int Phonenumber
        {
            get { return phonenumber; }
            private set { phonenumber = value; }
        }
        public string Email
        {
            get { return email; }
            private set { email = value; }
        }
        public string Password
        {
            get { return password; }
            private set { password = value; }
        }

        public Customer(string nameInput, string addressInput, int zipcodeInput, string cityInput, int phonenumberInput, string emailInput, string passwordInput)
        {
            nameInput = name;
            addressInput = address;
            zipcodeInput = zipcode;
            cityInput = city;
            phonenumberInput = phonenumber;
            emailInput = email;
            passwordInput = password;
        }
    }
}
