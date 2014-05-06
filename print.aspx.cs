using System;
using System.Web.UI;

public partial class Print : Page
{
    
        protected void Page_Load(object sender, EventArgs e)
    {
        var ctrl = (Control)Session["ctrl"];
        PrintHelper.PrintWebControl(ctrl);
    }
    
}