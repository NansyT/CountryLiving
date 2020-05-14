using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class Reservation
    {
        private int reservationID;
        private Room room;
        private Customer customer;
        private DateTime created;
        private DateTime from;
        private DateTime to;
        
        public int ReservationID
        {
            get { return reservationID; }
            private set { reservationID = value; }
        }

        public Room Room
        {
            get { return room; }
            private set { room = value; }
        }

        public Customer Customer
        {
            get { return customer; }
            private set { customer = value; }
        }

        public DateTime Created
        {
            get { return created; }
            private set { created = value; }
        }

        public DateTime To
        {
            get { return to; }
            private set { to = value; }
        }

        public DateTime From
        {
            get { return from; }
            private set { from = value; }
        }
    }
}
