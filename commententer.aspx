<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commententer.aspx.cs" Inherits="css_commententer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Enter Comments</h2>

    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:DropDownList ID="classDropDownList" runat="server">
        <asp:ListItem>--select a class/section--</asp:ListItem>
    </asp:DropDownList>
    
    <div id="commentTextBoxDiv">
        
        <asp:TextBox ID="commentTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="addCommentButton" runat="server" Text="Add Comment" />

    </div>

</asp:Content>

