using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Website
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Implentering mangler
        }

        protected void SubmitLogin(object sender, EventArgs e)
        {
            //Implentering mangler
            Debug.WriteLine(txtname.Text);
            Debug.WriteLine(txtaddress.Text);
            Debug.WriteLine(txtzipcode.Text);
            Debug.WriteLine(txtcity.Text);
            Debug.WriteLine(txtnumber.Text);
            Debug.WriteLine(txtmail.Text);
            Debug.WriteLine(txtPassword.Text);
        }
    }
}