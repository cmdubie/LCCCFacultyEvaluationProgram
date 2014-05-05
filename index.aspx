<%@ Page Title="" Language="C#" MasterPageFile="~/FEP.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" Runat="Server">
    <h1>Faculty Evaluation Program</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContent" Runat="Server">
    
    <asp:Panel ID="logInPanel" runat="server">
        <asp:Login ID="Login" runat="server"></asp:Login>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="aboutPanel">
        <h2><a href="data.aspx">Data Entry and Review</a></h2>
            <ul class="sectionContents">
                <li><a href="import.aspx">Import</a> - transfer data from a .csv file to the application database.</li>
                <li><a href="faculty.aspx">Faculty</a> - view a table of all faculty members in the database and add or correct related information.</li>
                <li><a href="section.aspx">Class/Section</a> - view a table of classes by term and correct related information.</li>
                <li><a href="comments.aspx">Comments</a> - add, change, or delete comments for a class/section.</li>
            </ul>
        <h2><a href="reports.aspx">Reports</a></h2>
            <ul class="sectionContents">
                <li><a href="email.aspx">Email</a> - send emails to full-time faculty requesting class selections for evaluation.</li>
                <li><a href="coversheets.aspx">Cover Sheets</a> - view a table of all classes flagged for evaluation and print cover sheets.</li>
                <li><a href="commentreports.aspx">Comment Reports</a> - print comment reports for a single class (with comments displayed) or for all classes (no display).</li>
            </ul>
        <%--<h2><a href="maintenance.aspx">Maintenance</a></h2>--%>
    </asp:Panel>

</asp:Content>