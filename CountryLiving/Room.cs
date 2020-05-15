using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryLiving
{
    class Room
    {
        private int roomID;
        private string supplementNumber;
        private bool status;

        public int RoomID
        {
            get { return roomID; }
            private set { roomID = value; }
        }

        public string SupplementNumber
        {
            get { return supplementNumber; }
            private set { supplementNumber = value; }
        }

        public bool Status
        {
            get { return status; }
            private set { status = value; }
        }
    }
}
