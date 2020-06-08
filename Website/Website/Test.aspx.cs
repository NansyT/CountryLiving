using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryLiving;
using Npgsql;


namespace Website
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private void TestTest()
        {
            SqlManager test = new SqlManager();
            test.InsertPerson("test8", "test", "test", 1234, 88888888, "testtest");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TestTest();
        }
    }
}