using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        //Ved Klik Overfør Over til ChooseRoom, så man kan vælge sit værelse
        protected void ChooseRoombtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChooseRoom.aspx");
        }
    }
}