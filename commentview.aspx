<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commentview.aspx.cs" Inherits="commentview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>View Comments</h2>

    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:DropDownList ID="classDropDownList" runat="server">
        <asp:ListItem>--select a class/section--</asp:ListItem>
    </asp:DropDownList>

    <p>This page will display comments for the class selected.</p>

</asp:Content>


