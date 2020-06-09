using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using Npgsql;
using CountryLiving;

namespace Website
{
    public partial class ChooseRoom : System.Web.UI.Page
    {
        //SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            StartdatoInput.Value = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
            SlutdatoInput.Value = DateTime.Now.AddDays(14).ToString("dd/MM/yyyy");

            string conS = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
            NpgsqlConnection con = new NpgsqlConnection(conS);
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM room", con);
            con.Open();
            displayrooms.DataSource = cmd.ExecuteReader();
            displayrooms.DataBind();
            con.Close();
        }

        protected void Filter_Button_Click(object sender, EventArgs e)
        {
            if (Filter_Checkboxlist.Visible == true)
            {
                Filter_Checkboxlist.Visible = false;
            }
            else
            {
                Filter_Checkboxlist.Visible = true;
            }
        }
    }
}