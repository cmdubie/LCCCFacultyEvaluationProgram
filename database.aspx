<%@ Page Title="" Language="C#" MasterPageFile="~/maintenance.master" AutoEventWireup="true" CodeFile="database.aspx.cs" Inherits="backup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Database</h2>
    
    <p>Once either button is selected, the user will be prompted for a file location.</p>

    <p><asp:Label ID="maintenanceMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to back-up and restoration of the database."></asp:Label></p>
    
    <asp:Button ID="backUpButton" runat="server" Text="Back-up" />
    <asp:Button ID="restoreButton" runat="server" Text="Restore" />
    
    <p>Selecting "Purge" will remove any comment entries that are older than five years.</p>
    
    <p><asp:Label ID="purgeMessageLabel" CssClass="messageLabel" runat="server" Text="This label will display error and success messages pertaining to purging the database."></asp:Label></p>


    <asp:Button ID="purgeButton" runat="server" Text="Purge" />

</asp:Content>

