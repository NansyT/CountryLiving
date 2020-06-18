using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryLiving;

namespace Website
{
    public partial class BookingCompletion : System.Web.UI.Page
    {
        static ReservationManager reservation = new ReservationManager();
        static SqlManager con = new SqlManager();
        static CustomerManager customer = new CustomerManager();

        /// <summary>
        ///  When page loads, it will send a query to database by using the Url, which holds roomid, start date and end date and then return the data.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Checks if URL holds the strings: roomID, start and slut
            if (!string.IsNullOrEmpty(Request.QueryString["roomID"]) &&
                !string.IsNullOrEmpty(Request.QueryString["start"]) &&
                !string.IsNullOrEmpty(Request.QueryString["slut"]))
            {
                bookcompletion.DataSource = con.Bookinformation(Convert.ToDateTime(Request.QueryString.Get("start")), Convert.ToDateTime(Request.QueryString.Get("slut")), Session["mail"].ToString(), Convert.ToInt32(Request.QueryString.Get("roomID"))).ExecuteReader();
                bookcompletion.DataBind();
                con.SqlConnection(false);
            }
        }


        /// <summary>
        ///  If user decides to complete the booking, it will create a reservation by using the ReservationManager.
        /// </summary>
        protected void BookCompleteButton(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            if (btn.CommandName == "Complete")
            {
                reservation.CreateReservation(Convert.ToDateTime(Request.QueryString.Get("start")), Convert.ToDateTime(Request.QueryString.Get("slut")), Convert.ToInt32(Request.QueryString.Get("roomID")), customer.CreateCustomerObjFromSQL(Session["mail"].ToString()));
            }
        } 
    }
}