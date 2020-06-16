using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    public class Reservation
    {
        private Guid reservationID;
        private int roomId;
        private string customermail;
        private DateTime created;
        private DateTime from;
        private DateTime to;
        
        public Guid ReservationID
        {
            get { return reservationID; }
            private set { reservationID = value; }
        }

        public int RoomId
        {
            get { return roomId; }
            private set { roomId = value; }
        }

        public string CustomerMail
        {
            get { return customermail; }
            private set { customermail = value; }
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

        public Reservation(int roomid, string customermail, DateTime createddate, DateTime todate, DateTime fromdate)
        { 
            RoomId = roomid;
            CustomerMail = customermail;
            Created = createddate;
            To = todate; 
            From = fromdate;
        }
    }
}
