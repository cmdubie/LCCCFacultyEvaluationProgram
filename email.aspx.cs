using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["stickyTerm"] != null)
            {
                termDropDownList.SelectedValue = Session["stickyTerm"].ToString();
                sendMailButton.Enabled = true;
            }
        }
    }

    protected void TermDDLIndexChangedEvent(object sender, EventArgs e)
    {
        StickyTermSelected();

        if (termDropDownList.SelectedIndex == 0)
        {
            sendMailButton.Enabled = false;
        }

        if (termDropDownList.SelectedIndex > 0)
        {
            sendMailButton.Enabled = true;
        }
    }

    protected void StickyTermSelected()
    {
        Session["stickyTerm"] = termDropDownList.SelectedValue;
    }
}