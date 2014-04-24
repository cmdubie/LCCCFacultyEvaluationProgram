using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class commententer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void addCommentButton_Click(object sender, EventArgs e)
    {
        try
        {
            // code to insert the comment into the database goes here

            commentTextBox.Text = String.Empty;
            commentTextBox.Focus();
        }
        catch (Exception)
        {
            
            throw;
        }

    }
}