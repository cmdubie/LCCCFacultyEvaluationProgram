using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Commentview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        classDropDownList.Enabled = false;

        if (!IsPostBack)
        {
            if (Session["stickyTerm"] != null)
            {
                termDropDownList.SelectedValue = Session["stickyTerm"].ToString();
                classDropDownList.Enabled = true;
            }
        }

        if (termDropDownList.SelectedIndex > 0)
        {
            classDropDownList.Enabled = true;
        }
    }

    protected void StickyTermSelected(object sender, EventArgs e)
    {
        Session["stickyTerm"] = termDropDownList.SelectedValue;
    }
}