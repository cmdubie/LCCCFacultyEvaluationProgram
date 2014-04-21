using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        aboutPanel.Visible = false;
        //Session["userID"] = 21; 

        if (Session["userID"] != null)
        {
            aboutPanel.Visible = true;
            logInPanel.Visible = false;
        }
    }
}