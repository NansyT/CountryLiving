using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    public class Reservation
    {
        //create values in Reservation
        private Guid reservationID;
        private int roomId;
        private string customermail;
        private DateTime from;
        private DateTime to;
        
        //make them public get 
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
        //Method for constructor 
        public Reservation(int roomid, string customermail, DateTime todate, DateTime fromdate)
        { 
            RoomId = roomid;
            CustomerMail = customermail;
            To = todate; 
            From = fromdate;
        }
    }
}
