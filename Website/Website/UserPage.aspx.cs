﻿using System;
using System.Collections.Generic;
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
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM customer", con);
            con.Open();
            displayInfo.DataSource = cmd.ExecuteReader();
            displayInfo.DataBind();
            con.Close();

        }
    }
}