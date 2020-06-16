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
            bookcompletion.DataSource = con.Bookinformation(Convert.ToDateTime("16-06-2020"), Convert.ToDateTime("23-06-2020"), "test3", 200);
            bookcompletion.DataBind();
            bookcompletion.Visible = true;
            con.SqlConnection(false);
            //string test = Convert.ToString(Eval("services"));
            //services1.Text = "<br /> \u2022 " + test.Replace(", ", "<br /> \u2022 ");
        }
    }
}