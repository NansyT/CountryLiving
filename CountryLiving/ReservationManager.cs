using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    public class ReservationManager : SqlManager
    {
        public void CreateReservation(DateTime from, DateTime to, int roomID, Customer customer)
        {
            Reservation newreservation = new Reservation(roomID, customer.Email, to, from);
            CreateReservationSQL(newreservation);
            Debug.WriteLine("Reservation created");
        }
        
        public void SeeReservation(int reservationID)
        {
            
            Debug.WriteLine("Looking at reservation");
        }

        public void EditReservation()
        {
            Debug.WriteLine("Editing reservation");
        }

        public void DeleteReservation(int reservationID, Reservation sas)
        {
            //Debug.WriteLine("Reservation deleted");
        }

    }
}
