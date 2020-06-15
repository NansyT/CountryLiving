using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.EnterpriseServices;
using System.Web.UI.WebControls;
using CountryLiving;
using Npgsql;

namespace Website
{
    public partial class ChooseRoom : System.Web.UI.Page
    {
        static SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Skal ikke være her... flytter senere
                StartDato.Value = DateTime.Now.ToString("dd/MM/yyyy");
                SlutDato.Value = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
                DoOnStartUp();
            }
        }

        protected void DoOnStartUp()
        {
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
            for (int i = 0; i < Filter_Checkboxlist.Items.Count; i++)
            {
                if (Filter_Checkboxlist.Items[i].Selected == true)
                {
                    items.Add(Filter_Checkboxlist.Items[i].Text);
                }
                else
                {
                    items.Add("");
                }
            }
            //displayrooms.Visible = true;

            SearchRooms(StartDato.Value, SlutDato.Value, "Altan", "Dobbeltseng", "", "", "", "", "");
        }

        protected void SearchRooms(string inDate, string outDate, string i1, string i2, string i3, string i4, string i5, string i6, string i7)
        {
            displayrooms.DataSource = con.SelectAvailableRooms(inDate, outDate, i1, i2, i3, i4, i5, i6, i7).ExecuteReader();
            Debug.WriteLine(i1 + " & " + i2 + " & " + i3 + " & " + i4 + " & " + i5 + " & " + i6 + " & " + i7);
            displayrooms.DataBind();
            displayrooms.Visible = true;
            con.SqlConnection(false);

        }

        protected void bookhere_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            if(btn.CommandName == "CheckForBook")
            {
                Response.Redirect("RoomDetails.aspx?roomID=" + btn.CommandArgument.ToString() + "?start=" + StartDato.Value + "?slut=" + SlutDato.Value);
            }
        }
    }
}