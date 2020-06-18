using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using CountryLiving;
using Npgsql;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql.TypeHandlers.NumericHandlers;
using System.Data.SqlClient;

namespace Website
{

    public partial class RoomDetails : System.Web.UI.Page
    {
        
        static SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //hvis der er data i URL bliver den sand, hvis der er værdier for roomID, start og slut
            if (!string.IsNullOrEmpty(Request.QueryString["roomID"]) && 
                !string.IsNullOrEmpty(Request.QueryString["start"]) && 
                !string.IsNullOrEmpty(Request.QueryString["slut"]))
            {
                //De forskellige infoer så som prisen for rummet og prisen for hele perioden, bliver hentet fra databasen, ved hjælp af viden fra URL
                roomDetailsinfo.DataSource = con.Roominformation(Convert.ToInt32(Request.QueryString.Get("roomID")), Convert.ToDateTime(Request.QueryString.Get("start")), Convert.ToDateTime(Request.QueryString.Get("slut"))).ExecuteReader();
                roomDetailsinfo.DataBind();
                roomDetailsinfo.Visible = true;
                con.SqlConnection(false);
                
            }
            else
            {
                errormessage.Text = "Der er ikke valgt et værelse eller periode for en booking"; // fejl besked hvis if ikke er sand
                errormessage.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["mail"] == null)
            {
                //sender dig til en login/lav bruger side, vis du ikke allerede er logget ind
                Response.Redirect("Login.aspx?ReturnUrl=" + 
                    Server.UrlEncode("BookingCompletion.aspx?roomID=" + 
                    Convert.ToInt32(Request.QueryString.Get("roomID")) + 
                    "&start=" + Convert.ToDateTime(Request.QueryString.Get("start")) + 
                    "&slut=" + Convert.ToDateTime(Request.QueryString.Get("slut"))));
            }
            else
            {
                //videre sender dig til BookingCompletion, med de nødvendige dataer i URL
                Response.Redirect("BookingCompletion.aspx?roomID=" + Convert.ToInt32(Request.QueryString.Get("roomID")) + "&start=" + Convert.ToDateTime(Request.QueryString.Get("start")) + "&slut=" + Convert.ToDateTime(Request.QueryString.Get("slut")));
            }
        }

    }
}