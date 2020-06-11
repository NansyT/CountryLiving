using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using Npgsql;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql.TypeHandlers.NumericHandlers;

namespace Website
{

    public partial class RoomDetails : System.Web.UI.Page
    {
        public System.Collections.Specialized.NameValueCollection QueryString { get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            String roomID = Request.QueryString.Get("roomID");
            string conS = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
            NpgsqlConnection con = new NpgsqlConnection(conS);
            roomID = "101";
            NpgsqlCommand cmd = new NpgsqlCommand($"SELECT price FROM room WHERE pk_room_id {roomID}=", con);
      
            if (roomID != null)
            {
                Debug.WriteLine("du har en id");
                LabelRoom.Text = roomID;
                LabelPrice.Text = cmd.();
            }
            else
            {
                Debug.WriteLine("ikke funktionel");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingCompletion.aspx");
        }
    }
}