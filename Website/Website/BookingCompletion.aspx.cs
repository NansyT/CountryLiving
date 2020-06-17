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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["roomID"]) &&
                !string.IsNullOrEmpty(Request.QueryString["start"]) &&
                !string.IsNullOrEmpty(Request.QueryString["slut"]))
            {
                bookcompletion.DataSource = con.Bookinformation(Convert.ToDateTime(Request.QueryString.Get("start")), Convert.ToDateTime(Request.QueryString.Get("slut")), Session["mail"].ToString(), Convert.ToInt32(Request.QueryString.Get("roomID"))).ExecuteReader();
                bookcompletion.DataBind();
                con.SqlConnection(false);
            }
           
            //string services = Convert.ToString(Eval("services"));
            // = "<br /> \u2022 " + test.Replace(", ", "<br /> \u2022 ");
        }

        protected void BookCompleteButton(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            if (btn.CommandName == "Complete")
            {
                string[] arg = new string[3];
                arg = btn.CommandArgument.ToString().Split(';');
                reservation.CreateReservation(Convert.ToDateTime(arg[0]).Date, Convert.ToDateTime(arg[1]).Date, int.Parse(arg[2]), customer.CreateCustomerObjFromSQL(Session["mail"].ToString()));
                Debug.WriteLine("Success:" + arg[0] + " & " + arg[1] + " & " + arg[2]);
            }
        }
    }
}