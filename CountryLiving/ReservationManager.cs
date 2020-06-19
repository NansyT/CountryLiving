using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    public class ReservationManager
    {
        SqlManager con = new SqlManager(); // make an conection to sqlmanager 

        public void CreateReservation(DateTime from, DateTime to, int roomID, Customer customer)
        {
            Reservation newreservation = new Reservation(roomID, customer.Email, to, from); //create an reservation
            con.CreateReservationSQL(newreservation); //call mothod to insert an reservation in database
            //Debug.WriteLine("Reservation created");
        }
        
        public void SeeReservation(int reservationID)
        {
            //har ikke nået at implementere 
            //Debug.WriteLine("Looking at reservation");
        }


        public void DeleteReservation(int reservationID, Reservation sas)
        {
            //har ikke nået at implementere 
            //Debug.WriteLine("Reservation deleted");
        }

    }
}
