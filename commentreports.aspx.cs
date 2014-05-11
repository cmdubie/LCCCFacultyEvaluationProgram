using System;
using System.Activities.Expressions;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
                if (Session["stickyTerm"].ToString() != "-1")
                {
                    classDropDownList.Enabled = true;
                }
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

    protected void printCommentsButton_Click(object sender, EventArgs e)
    {
        if (classDropDownList.SelectedValue == "0")
        {
            var panelList = new ArrayList();

            var DetailsHeaderDataSource2 = new SqlDataSource
                {
                    ProviderName =
                        ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName,
                    ConnectionString =
                        ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
                    SelectCommand =
                        "SELECT f.Name, cs.Term, cs.ClassNum, (cs.CourseID + ' ' + cs.Section + ' - ' + c.Title) AS CourseSection FROM COURSESECTION AS cs INNER JOIN COURSE AS c ON cs.CourseID = c.CourseID LEFT OUTER JOIN FACULTY AS f ON cs.EID = f.EID WHERE (cs.Term = @Param1) AND Evaluation = 'Y' ORDER BY cs.CourseID"
                };

            DetailsHeaderDataSource2.SelectParameters.Add("Param1", termDropDownList.SelectedValue);
                
            var headerSource = (DataView)DetailsHeaderDataSource2.Select(DataSourceSelectArguments.Empty);

            if (headerSource != null)
            {
                for (var i = 0; i < headerSource.Count; i++)
                {
                    commentReportHeaderDetailsView.DataSourceID = "";
                    commentReportHeaderDetailsView.DataSource = DetailsHeaderDataSource2;
                    commentReportHeaderDetailsView.DataBind();

                    var commentGVDataSource2 = new SqlDataSource
                    {
                        ProviderName =
                            ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName,
                        ConnectionString =
                            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
                        SelectCommand =
                            "SELECT [StudentComments],  CommentID FROM [COMMENT] WHERE (([ClassNum] = @ClassNum) AND ([Term] = @Term)) ORDER BY CommentID DESC"
                    };

                commentGVDataSource2.SelectParameters.Add("ClassNum", headerSource[i][2].ToString());
                commentGVDataSource2.SelectParameters.Add("Term", termDropDownList.SelectedValue);

                var commentSource = (DataView) commentGVDataSource2.Select(DataSourceSelectArguments.Empty);

                commentReportCommentsGridView.DataSourceID = "";
                commentReportCommentsGridView.DataSource = commentGVDataSource2;
                commentReportCommentsGridView.DataBind();

                panelList.Add(printPanel);
                }
            }

            Session["ctrlList"] = panelList;
            ClientScript.RegisterStartupScript(GetType(), "onclick",
                "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");

            Session["ctrlList"] = new ArrayList();
        }
        else
        {
            var panelList = new ArrayList {printPanel};
            Session["ctrlList"] = panelList;
            ClientScript.RegisterStartupScript(GetType(), "onclick",
                "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");

        }
    }
}