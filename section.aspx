<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="section.aspx.cs" Inherits="section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Class/Section</h2>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" >
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="ClassGVSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT cs.ClassNum, cs.Term, cs.CourseID, c.Title, cs.EID, cs.Section, cs.Evaluation, cs.NumberStudents 
FROM COURSESECTION AS cs, COURSE AS c
WHERE cs.CourseID = c.CourseID
AND (cs.Term = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ClassSectionGridView" runat="server"></asp:GridView>
    
    <p>This section will have a gridview that will display all information for classes in the database.  Users will be able to edit or delete any entry in the table to make corrections.</p>

</asp:Content>

