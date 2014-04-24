<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commententer.aspx.cs" Inherits="commententer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link href="css/commententer.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <h2>Enter Comments</h2>

    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:DropDownList ID="classDropDownList" runat="server">
        <asp:ListItem>--select a class/section--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:panel runat="server" id="commentTextBoxPanel" DefaultButton="addCommentButton">
        
        <asp:TextBox ID="commentTextBox" runat="server" TextMode="MultiLine" Wrap="True"></asp:TextBox>
        <asp:Button ID="addCommentButton" runat="server" Text="Add Comment" OnClick="addCommentButton_Click" />

    </asp:panel>

</asp:Content>

