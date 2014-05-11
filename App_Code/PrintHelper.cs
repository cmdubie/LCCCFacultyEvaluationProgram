using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Web.SessionState;

public class PrintHelper
{
    public static void PrintWebControl(Control ctrl)
    {
        PrintWebControl(ctrl, string.Empty);
    }

    public static void PrintWebControl(Control ctrl, string script)
    {
        var stringWrite = new StringWriter();
        var htmlWrite = new HtmlTextWriter(stringWrite);
        var control = ctrl as WebControl;
        if (control != null)
        {
            var w = new Unit(100, UnitType.Percentage); control.Width = w;
        }
        var pg = new Page {EnableEventValidation = false};
        if (script != string.Empty)
        {
            pg.ClientScript.RegisterStartupScript(pg.GetType(), "PrintJavaScript", script);
        }
        var frm = new HtmlForm();
        pg.Controls.Add(frm);
        frm.Attributes.Add("runat", "server");
        frm.Controls.Add(ctrl);
        pg.DesignerInitialize();
        pg.RenderControl(htmlWrite);
        string strHTML = stringWrite.ToString();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(strHTML);
        HttpContext.Current.Response.Write("<script>window.print();</script>");
        HttpContext.Current.Response.End();
    }

    public static void PrintWebControl(Control[] ctrlArray, string script)
    {
        var stringWrite = new StringWriter();
        var htmlWrite = new HtmlTextWriter(stringWrite);
        var pg = new Page { EnableEventValidation = false };
        var frm = new HtmlForm();

        frm.Attributes.Add("runat", "server");

        foreach (var ctrl in ctrlArray)
        {
            var control = ctrl as WebControl;
            if (control != null)
            {
                var w = new Unit(100, UnitType.Percentage);
                control.Width = w;
            }

            frm.Controls.Add(ctrl);
        }

        if (script != string.Empty)
        {
            pg.ClientScript.RegisterStartupScript(pg.GetType(), "PrintJavaScript", script);
        }
        
        pg.Controls.Add(frm);
        pg.DesignerInitialize();
        pg.RenderControl(htmlWrite);
        var strHTML = stringWrite.ToString();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(strHTML);
        HttpContext.Current.Response.Write("<script>window.print();</script>");
        HttpContext.Current.Response.End();
    }
}