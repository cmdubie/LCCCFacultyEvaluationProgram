<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <section>
        <ul class="sectionContents">
            <li><a href="email.aspx">Email</a> - send emails to full-time faculty requesting class selections for evaluation.</li>
            <li><a href="coversheets.aspx">Cover Sheets</a> - view a table of all classes flagged for evaluation and print cover sheets.</li>
            <li><a href="commentreports.aspx">Comment Reports</a> - print comment reports for a single class (with comments displayed) or for all classes (no display).</li>
        </ul>
    </section>
</asp:Content>

