using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryLiving;

namespace Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitLogin(object sender, EventArgs e)
        {
            string passwordstr = txtPassword.Text;
            string emailstr = txtEmail.Text;
            SqlManager con = new SqlManager();
            int howmanyusers = con.GetCustomers(emailstr, passwordstr);
            if ( howmanyusers == 1 )
            {

            }
        }
    }
}