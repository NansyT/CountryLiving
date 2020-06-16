using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using CountryLiving;
using Npgsql;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql.TypeHandlers.NumericHandlers;
using System.Data.SqlClient;

namespace Website
{

    public partial class RoomDetails : System.Web.UI.Page
    {
        public System.Collections.Specialized.NameValueCollection QueryString { get; }
        static SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Henter Room ID fra URL'en 
            String getRoomID = Request.QueryString.Get("roomID");
            string [] roomID = getRoomID.Split('?');
            if (roomID != null)
            {
                Debug.WriteLine("du har en id");

                LabelRoom.Text = roomID[0];
                LabelPrice.Text = con.GetBasePrice(roomID[0]);
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