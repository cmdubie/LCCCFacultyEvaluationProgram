<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="commentreports.aspx.cs" Inherits="commentreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Comment Reports</h2>
    
    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:DropDownList ID="classDropDownList" runat="server">
        <asp:ListItem>--select a class/section--</asp:ListItem>
    </asp:DropDownList>

    <p>A gridview will display all comments for the class/section and term selected.</p>
    
    <p><asp:Label ID="printCommentsMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to printing comment reports."></asp:Label></p>
    
    <asp:Button ID="printCommentsButton" runat="server" Text="Print" />    
    
</asp:Content>

