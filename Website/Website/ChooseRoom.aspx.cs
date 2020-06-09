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
            StartdatoInput.Value = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
            SlutdatoInput.Value = DateTime.Now.AddDays(14).ToString("dd/MM/yyyy");
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