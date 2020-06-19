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

                //sets passwordstr to label txtPassword
                string passwordstr = txtPassword.Text;
                //sets emailstr to label txtEmail
                string emailstr = txtEmail.Text;
                CustomerManager customerman = new CustomerManager();
                int howmanyusers = customerman.CheckCustomer(emailstr, passwordstr); //get how many users with emailstr and password
                if (howmanyusers == 1) //if only one user we add users pk (mail) to the session
                {
                    Session["mail"] = emailstr;
                if (!string.IsNullOrEmpty(Request.QueryString["ReturnURL"])) //if url query(after page site, parameters) have an returnURL true
                {
                    Response.Redirect(Request.QueryString["ReturnURL"].ToString()); //then its redirect to the return url.
                }
                }
                else
                {
                    lblIncorrectMessage.Visible = true; // else then errormessage is visible
                }
            

        }
    }
}