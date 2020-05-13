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
        public void CreateReservation(DateTime from, DateTime to, int roomID)
        {
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

        public void DeleteReservation(int reservationID)
        {
            Debug.WriteLine("Reservation deleted");
        }
    }
}
