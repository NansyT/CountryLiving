using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    public class Customer
    {
        private string name;
        private string address;
        private int zipcode;
        private int phonenumber;
        private string email;
        private string password;

        //laver en public get variable så man kan se værdien men ikke sæt den
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
        
        //laver en konstruktør når man kalder en Customer
        public Customer(string emailInput, string nameInput, string addressInput, int zipcodeInput, int phonenumberInput)
        {
            Email = emailInput;
            Name = nameInput;
            Address = addressInput;
            Zipcode = zipcodeInput;
            Phonenumber = phonenumberInput;
        }
        //En konstruktør til når bruger opretter sig igennem hjemmesiden, hvor der er behøv for password
        public Customer(string emailInput, string nameInput, string addressInput, int zipcodeInput, int phonenumberInput, string passwordinput)
        {
            Email = emailInput;
            Name = nameInput;
            Address = addressInput;
            Zipcode = zipcodeInput;
            Phonenumber = phonenumberInput;
            Password = passwordinput;
        }

    }
}
