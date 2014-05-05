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
    
    <asp:Button ID="printCommentsButton" runat="server" Text="Print" OnClick="printCommentsButton_Click" /> 

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
    
<!-- attempt to create a report panel with repeaters instead of a gridview - PrintHelper does not acknowledge repeaters.  Attempted to pass it only commentRepeater and it did not print anything. -->
<%--    <asp:Panel runat="server" Visible="False"> <!-- make visible to view on page and debug -->
        <asp:Panel runat="server" ID="printPanel">
        
             <asp:SqlDataSource ID="RepeaterHeaderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT f.Name, cs.Term, cs.ClassNum, cs.CourseID, c.Title, cs.Section, cs.Evaluation, cs.NumberStudents 
                                FROM COURSESECTION AS cs 
                                INNER JOIN COURSE AS c ON cs.CourseID = c.CourseID 
                                LEFT OUTER JOIN FACULTY AS f ON cs.EID = f.EID
                                WHERE (cs.Term = @Param1) AND (cs.ClassNum = @Param2) 
                                ORDER BY cs.CourseID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="termDropDownList" Name="Param1" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="classDropDownList" Name="Param2" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:Repeater runat="server" DataSourceID="RepeaterHeaderDataSource" ID="commentReportHeaderRepeater">
                <ItemTemplate>
                    <h2>Student Comment Report</h2>
                    <p><asp:Label runat="server"><%# Eval("CourseID") %> </asp:Label>
                    <asp:Label runat="server"><%# Eval("Section") %> - </asp:Label>
                    <asp:Label runat="server"><%# Eval("Title") %> </asp:Label></p>
                    <p><asp:Label runat="server">Instructor: <%# Eval("Name") %> </asp:Label></p>
                </ItemTemplate>
            </asp:Repeater>
            <p><asp:Label ID="Label" runat="server"><%# Eval("ClassSection") %></asp:Label></p>
            <asp:Repeater ID="commentRepeater" DataSourceID="CommentSqlDataSource" runat="server">
                <HeaderTemplate>
                    <h3>Student Comments:</h3>
                </HeaderTemplate>
                <ItemTemplate>
                    <p> <%# Eval("StudentComments") %></p>
                </ItemTemplate>

            </asp:Repeater>

        </asp:Panel>
    </asp:Panel>--%>
 </asp:Content>

