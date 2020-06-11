using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web.UI.WebControls;
using CountryLiving;
using Npgsql;

namespace Website
{
    public partial class ChooseRoom : System.Web.UI.Page
    {
        SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Skal ikke være her... flytter senere
            StartDato.Value = "Start Dato";
            SlutDato.Value = "Slut Dato";

            string conS = "Host=localhost;Port=6666;Username=postgres;Password=Kode1234;Database=landlyst";
            NpgsqlConnection con = new NpgsqlConnection(conS);
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM room", con);
            con.Open();
            displayrooms.DataSource = cmd.ExecuteReader();
            displayrooms.DataBind();
            con.Close();

            for (int i = 0; i < Filter_Checkboxlist.Items.Count; i++)
            {
                Filter_Checkboxlist.Items[i].Selected = true;
            }

            displayrooms.Visible = false;
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
        protected void VælgDato_Click(object sender, EventArgs e)
        {
            if (StartDato.Value != "Start Dato" && SlutDato.Value != "Slut Dato")
            {
                //Convertere vores dato fra string til DateTime
                DateTime startDato = Convert.ToDateTime(StartDato.Value);
                DateTime sluttDato = Convert.ToDateTime(StartDato.Value);
                if (startDato < sluttDato)
                {
                    //Vi vil gerne ende her
                    Debug.WriteLine("Date is after today");
                }
                else
                {
                    //Slut dato er før start...
                    Debug.WriteLine("Din start dato skal være før din sidste dag");
                }
            }
            else
            {
                //Der mangler datoer
                Debug.WriteLine("Please enter date");
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            List<string> items = new List<string>();
            for(int i = 0; i < Filter_Checkboxlist.Items.Count; i++)
            {
                if(Filter_Checkboxlist.Items[i].Selected == true)
                {
                    items.Add(Filter_Checkboxlist.Items[i].Text);
                }
            }
        }
    }
}