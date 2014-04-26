<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Email</h2>
    
    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>

    <p>A gridview will display all full-time faculty that have a class for the term selected.</p>
    
    <p><asp:Label ID="emailMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to sending faculty emails."></asp:Label></p>
    
    <asp:Button ID="sendMailButton" runat="server" Text="Send Emails" />

</asp:Content>

