<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="section.aspx.cs" Inherits="Section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link rel="stylesheet" type="text/css" href="css/section.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Class/Section</h2>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="StickyTermSelected">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="ClassGVSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT f.Name, cs.Term, cs.ClassNum, cs.CourseID, c.Title, cs.Section, cs.Evaluation, cs.NumberStudents 
FROM COURSESECTION AS cs INNER JOIN 
     COURSE AS c ON cs.CourseID = c.CourseID LEFT OUTER JOIN 
     FACULTY AS f ON cs.EID = f.EID
WHERE (cs.Term = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ClassSectionGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Term,ClassNum" DataSourceID="ClassGVSqlDataSource">
        <Columns>
            <asp:BoundField DataField="ClassNum" HeaderText="No." ReadOnly="True" SortExpression="ClassNum" />
            <asp:BoundField DataField="CourseID" HeaderText="Course" SortExpression="CourseID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Section" HeaderText="Sect." SortExpression="Section" />
            <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="Name" />
            <asp:BoundField DataField="NumberStudents" HeaderText="Enrolled" SortExpression="NumberStudents" />
            <asp:BoundField DataField="Evaluation" HeaderText="Eval?" SortExpression="Evaluation" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    
    <p>This section will have a gridview that will display all information for classes in the database.  Users will be able to edit or delete any entry in the table to make corrections.</p>

</asp:Content>

