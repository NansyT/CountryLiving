using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class ReservationManager : SqlManager
    {
        Customer af = new Customer("f","t","gf", 3, 4, "ø");
        public void CreateReservation(DateTime from, DateTime to, int roomID, Customer tobiasergrim)
        {
            Reservation newreservation = new Reservation();
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
