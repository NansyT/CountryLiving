using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Website
{

    public partial class RoomDetails : System.Web.UI.Page
    {
        public System.Collections.Specialized.NameValueCollection QueryString { get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            String roomID = Request.QueryString.Get("roomID");

            roomID = "101";

            if (roomID != null)
            {
                Debug.WriteLine("du har en id");
                LabelRum.Text = roomID;
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