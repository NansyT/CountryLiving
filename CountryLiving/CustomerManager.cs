using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace CountryLiving
{
    public class CustomerManager
    {
        SqlManager con = new SqlManager();
        //Method til at lave en bruger fra hjemmesiden
        public void CreateCustomer(string name, string address, int zipcode, int phonenumber, string email, string password)
        {
            //Her bliver der lavet en kunde
            Customer customer = new Customer(email, name, address, zipcode, phonenumber, password);
            //Kundens værdier bliver indsat i en metode til at sende det til databasen
            con.InsertPerson(customer.Email, customer.Name, customer.Address, customer.Zipcode, customer.Phonenumber, customer.Password);
        }
        //Metode til at kalde ned i databasen
        public int CheckCustomer(string email, string password)
        {
            return con.GetCustomers(email, password);
        }
        //Laver en kunde til at kunne lave en reservation
        public Customer CreateCustomerObjFromSQL(string email)
        {
            //declare local variables 
            string name = null;
            string address = null;
            int zipcode = 0;
            int phone = 0;
            NpgsqlDataReader rdr = con.GetCustomerinfo(email).ExecuteReader(); //laver en sql reader til at læse queryen
            while(rdr.Read()) //for hver række der er i queryen
            {
                //sætter local værdierne til outputet fra sql statemen
                name = rdr[0].ToString(); 
                address = rdr[1].ToString();
                zipcode = Convert.ToInt32(rdr[2]);
                phone = Convert.ToInt32(rdr[3]);
            }
            //Debug.WriteLine("{0}\n{1}\n{2}\n{3}\n{4}", email, name, address, zipcode, phone); //til test
              Customer customer = new Customer(email, name, address, zipcode, phone); //opretter en customer 
                return customer;

            
            
        }
    }
}
