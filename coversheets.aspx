<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="coversheets.aspx.cs" Inherits="Coversheets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link href="css/coversheets.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Cover Sheets</h2>
    
    <p>Select a term to view class/sections that are flagged for evaluation for that term.</p>
    <p>Select the button to print the cover sheets for the classes displayed.</p>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="StickyTermSelected">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>

    <asp:Button ID="printCoverSheetsButton" runat="server" Text="Print" Enabled="False" OnClick="btnPrint_Click"/> 
    
    <asp:SqlDataSource ID="ClassGVSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT f.Name, cs.Term, cs.ClassNum, cs.CourseID, c.Title, cs.Section, cs.Evaluation, cs.NumberStudents 
FROM COURSESECTION AS cs INNER JOIN 
     COURSE AS c ON cs.CourseID = c.CourseID LEFT OUTER JOIN 
     FACULTY AS f ON cs.EID = f.EID
WHERE (cs.Term = @Param1) AND UPPER(cs.Evaluation) = 'Y'
ORDER BY cs.CourseID
" UpdateCommand="UPDATE COURSESECTION SET NumberStudents = @NumberStudents, Evaluation = @Evaluation WHERE (ClassNum = @ClassNum) AND (Term = @Term)" >
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumberStudents" />
            <asp:Parameter Name="Evaluation" Type="Char" />
            <asp:Parameter Name="ClassNum" />
            <asp:Parameter Name="Term" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:GridView ID="ClassSectionGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Term,ClassNum" DataSourceID="ClassGVSqlDataSource" CssClass="gridViewClass">
        <Columns>
            <asp:BoundField DataField="ClassNum" HeaderText="No." ReadOnly="True" SortExpression="ClassNum" />
            <asp:TemplateField HeaderText="Course" SortExpression="CourseID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sect." SortExpression="Section">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Section") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Instructor" SortExpression="Name">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enrolled" SortExpression="NumberStudents">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("NumberStudents") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>      

</asp:Content>

