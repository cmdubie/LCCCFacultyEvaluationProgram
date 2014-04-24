using System;

public partial class Default : System.Web.UI.Page
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