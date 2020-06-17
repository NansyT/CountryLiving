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
            
            //Henter Room ID fra URL'en 
            //String getRoomID = Request.QueryString.Get("roomID");
            //string [] roomID = getRoomID.Split('?');
            //if (roomID != null)
            //{
            //    Debug.WriteLine("du har en id");

            //    LabelRoom.Text = roomID[0];

            //    //roomDetailsinfo.DataSource = con.Roominformation(roomID[0], roomID[1], roomID[2]);
            //}
            //else
            //{
            //    Debug.WriteLine("ikke funktionel");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["mail"] == null)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + 
                    Server.UrlEncode("BookingCompletion.aspx?roomID=" + 
                    Convert.ToInt32(Request.QueryString.Get("roomID")) + 
                    "&start=" + Convert.ToDateTime(Request.QueryString.Get("start")) + 
                    "&slut=" + Convert.ToDateTime(Request.QueryString.Get("slut"))));
            }
            else
            {
                Response.Redirect("BookingCompletion.aspx?roomID=" + Convert.ToInt32(Request.QueryString.Get("roomID")) + "&start=" + Convert.ToDateTime(Request.QueryString.Get("start")) + "&slut=" + Convert.ToDateTime(Request.QueryString.Get("slut")));
            }
        }

    }
}