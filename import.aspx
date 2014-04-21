<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="import.aspx.cs" Inherits="import" %>

<asp:Content ID="Content1" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Import</h2>
    
    <p>This paragraph will contain instructions for the name and location of the XML file to be imported.</p>
    
    <p>A note will be added stating that the user can review the imported information by selecting the appropriate button at the top of the page.</p>
    
    <p><asp:Label ID="importMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to the import."></asp:Label></p>
    
    <asp:Button ID="importButton" runat="server" Text="Import" />
</asp:Content>

