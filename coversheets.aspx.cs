using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class coversheets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["stickyTerm"] != null)
            {
                termDropDownList.SelectedValue = Session["stickyTerm"].ToString();
                printCoverSheetsButton.Enabled = true;
            }
        }
    }

    protected void StickyTermSelected(object sender, EventArgs e)
    {
        Session["stickyTerm"] = termDropDownList.SelectedValue;

        if (termDropDownList.SelectedIndex == 0)
        {
            printCoverSheetsButton.Enabled = false;
        }

        if (termDropDownList.SelectedIndex > 0)
        {
            printCoverSheetsButton.Enabled = true;
        }
    }
}