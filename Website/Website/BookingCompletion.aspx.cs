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
            bookcompletion.DataSource = con.Bookinformation(Convert.ToDateTime("16-06-2020"), Convert.ToDateTime("23-06-2020"), Session["mail"].ToString(), 200).ExecuteReader();
            bookcompletion.DataBind();
            con.SqlConnection(false);
           
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
                reservation.CreateReservation(Convert.ToDateTime(arg[0]), Convert.ToDateTime(arg[1]), Convert.ToInt32(arg[2]), customer.CreateCustomerObjFromSQL(Session["mail"].ToString()));
                Debug.WriteLine("Success");
            }
        }
    }
}