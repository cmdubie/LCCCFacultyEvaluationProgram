using System;
using System.Web.UI.WebControls;

public partial class Coversheets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["stickyTerm"] != null)
            {
                termDropDownList.SelectedValue = Session["stickyTerm"].ToString();
                if (Session["stickyTerm"].ToString() != "-1")
                {
                    printCoverSheetsButton.Enabled = true;
                }
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
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = ClassSectionGridView;
        ClientScript.RegisterStartupScript(GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
    }

    public object printPanel { get; set; }
}