<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="commentreports.aspx.cs" Inherits="Commentreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link href="css/gridview.css" rel="stylesheet" type="text/css"/>
    <link href="css/commentreports.css" type="text/css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Comment Reports</h2>
    
    <p>Select a term and class/section to view and print the comments for a specific class/section.</p>
    <p>Select "all classes" from the drop-down menu to print the reports for each evaluated class from the term.</p>
    
    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>

    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="TermDDLIndexChangedEvent">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:SqlDataSource ID="classDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CourseID + ' - ' + Section AS ClassSection, ClassNum
from COURSESECTION AS cs
where Term = @Term and UPPER(Evaluation) = 'Y'
order by ClassSection" >
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="classDropDownList" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="classDataSource" DataTextField="ClassSection" DataValueField="ClassNum" OnSelectedIndexChanged="ClassDDLIndexChangedEvent">
        <asp:ListItem Value="-1">--select a class/section--</asp:ListItem>
        <asp:ListItem Value="0">--ALL CLASSES--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:Button ID="printCommentsButton" runat="server" Text="Print" /> 

    <p><asp:Label ID="printCommentsMessageLabel" CssClass="messageLabel" runat="server" Text=""></asp:Label></p>
    
        <asp:SqlDataSource ID="CommentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StudentComments],  CommentID
FROM [COMMENT] 
WHERE (([ClassNum] = @ClassNum) AND ([Term] = @Term)) ORDER BY CommentID DESC" >
        <DeleteParameters>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="classDropDownList" Name="ClassNum" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ClassSectionCommentsGridView" runat="server" DataSourceID="CommentSqlDataSource" AutoGenerateColumns="False" CssClass="gridViewClass">
        <Columns>
            <asp:TemplateField HeaderText="Student Comments" SortExpression="StudentComments">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentComments") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentComments") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   
</asp:Content>

