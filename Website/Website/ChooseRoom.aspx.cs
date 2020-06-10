using System;
using System.Diagnostics;
using CountryLiving;

namespace Website
{
    public partial class ChooseRoom : System.Web.UI.Page
    {
        SqlManager con = new SqlManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            StartDato.Value = "Start Dato";
            SlutDato.Value = "Slut Dato";
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
    }
}