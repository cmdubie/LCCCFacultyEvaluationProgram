using System;
using System.Web.UI.WebControls;

public partial class Commentreports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        classDropDownList.Enabled = false;

        if (classDropDownList.SelectedIndex == 0)
        {
            printCommentsButton.Enabled = false;
        }

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

    protected void ClassDDLIndexChangedEvent(object sender, EventArgs e)
    {
        if (classDropDownList.SelectedIndex > 0)
        {
            printCommentsButton.Enabled = true;
        }
    }

    protected void TermDDLIndexChangedEvent(object sender, EventArgs e)
    {
        StickyTermSelected();

        if (termDropDownList.SelectedIndex == 0)
        {
            classDropDownList.SelectedIndex = 0;
            printCommentsButton.Enabled = false;
        }

        classDropDownList.Items.Clear();
        var dummyItem = new ListItem { Value = "-1", Text = "--select a class/section--" };
        var allClassesItem = new ListItem { Value = "0", Text = "--ALL CLASSES--" };
        classDropDownList.Items.Insert(0, dummyItem);
        classDropDownList.Items.Insert(1, allClassesItem);
        
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