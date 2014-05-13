using System;
using System.Collections;
using System.Web.UI;

public partial class Print : Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        var ctrlArray = (ArrayList)Session["ctrlList"];
        PrintHelper.PrintWebControl(ctrlArray, String.Empty);
    }
    
}