using System;

public partial class Section : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["stickyTerm"] != null)
            {
                termDropDownList.SelectedValue = Session["stickyTerm"].ToString();
            }
        }
    }

    protected void StickyTermSelected(object sender, EventArgs e)
    {
        Session["stickyTerm"] = termDropDownList.SelectedValue;        
    }
}