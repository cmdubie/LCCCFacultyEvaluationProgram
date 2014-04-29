<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="import.aspx.cs" Inherits="import" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Import</h2>
    
    <p>Please ensure that the file "220.txt" has been converted to "220.csv."</p>
    
    <p>Press the button to import the data from "220.csv" into the application database.</p>
    
    <p>You will recieve a message stating the success or failure of the import.</p>
    
    <p><asp:Label ID="importMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to the import."></asp:Label></p>
    
    <asp:Button ID="importButton" runat="server" Text="Import" />
</asp:Content>

