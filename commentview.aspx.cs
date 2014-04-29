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

    protected void TermDDLIndexChangedEvent(object sender, EventArgs e)
    {
        StickyTermSelected();

        if (termDropDownList.SelectedIndex == 0)
        {
            classDropDownList.SelectedIndex = 0;
        }

        classDropDownList.Items.Clear();
        var dummyItem = new ListItem { Value = "-1", Text = "--select a class/section--" };
        classDropDownList.Items.Insert(0, dummyItem);
        
        if (termDropDownList.SelectedIndex > 0)
        {
            classDropDownList.DataBind();
        }
    }

    protected void StickyTermSelected()
    {
        Session["stickyTerm"] = termDropDownList.SelectedValue;
    }
}