<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="data.aspx.cs" Inherits="data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <section>
        <ul class="sectionContents">
            <li><a href="import.aspx">Import</a> - transfer data from a .csv file to the application database.</li>
            <li><a href="faculty.aspx">Faculty</a> - view a table of all faculty members in the database and add or correct related information.</li>
            <li><a href="section.aspx">Class/Section</a> - view a table of classes by term and correct related information.</li>
            <li><a href="comments.aspx">Comments</a> - add, change, or delete comments for a class/section.</li>
        </ul>
    </section>
</asp:Content>

