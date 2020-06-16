using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryLiving;

namespace Website
{
    public partial class BookingCompletion : System.Web.UI.Page
    {
        static SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            bookcompletion.DataSource = con.Bookinformation(Convert.ToDateTime("16-06-2020"), Convert.ToDateTime("23-06-2020"), "test", 200).ExecuteReader();
            bookcompletion.DataBind();
            con.SqlConnection(false);
           
            
            //string services = Convert.ToString(Eval("services"));
            // = "<br /> \u2022 " + test.Replace(", ", "<br /> \u2022 ");
        }
    }
}