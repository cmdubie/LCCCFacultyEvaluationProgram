<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commententer.aspx.cs" Inherits="css_commententer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <p>This page will have drop-down menus to select the term and class/section.  The term will default to the most recent term and the class/section will retain the last item selected.</p>
    <p>A large text area will be added to enter the comments into (one at a time).  Once the comment is finished, it will be added to the database using the "Add" button, which will be tied to the &lt;Enter&gt; key.</p>
</asp:Content>

