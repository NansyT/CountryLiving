using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace Website
{
    public partial class UserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conS = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
            NpgsqlConnection con = new NpgsqlConnection(conS);
            NpgsqlCommand userinfo = new NpgsqlCommand("SELECT * FROM customer LEFT JOIN booking ON booking.fk_customer_email = customer.pk_email WHERE booking.fk_customer_email IS NOT NULL AND customer.pk_email = @mail", con);
            userinfo.Parameters.AddWithValue("mail", Session["mail"]);
            con.Open();
            displayInfo.DataSource = userinfo.ExecuteReader();
            displayInfo.DataBind();
            con.Close();
        }
    }
}