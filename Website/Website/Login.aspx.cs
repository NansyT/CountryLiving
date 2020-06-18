using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryLiving;

namespace Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mail"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void SubmitLogin(object sender, EventArgs e)
        {
            Debug.WriteLine("Du har trykket på login knappen");

                string passwordstr = txtPassword.Text;
                string emailstr = txtEmail.Text;
                CustomerManager customerman = new CustomerManager();
                int howmanyusers = customerman.CheckCustomer(emailstr, passwordstr);
                if (howmanyusers == 1)
                {
                    Session["mail"] = emailstr;
                if (!string.IsNullOrEmpty(Request.QueryString["ReturnURL"]))
                {
                    Response.Redirect(Request.QueryString["ReturnURL"].ToString());
                }
                }
                else
                {
                    lblIncorrectMessage.Visible = true;
                }
            

        }
    }
}