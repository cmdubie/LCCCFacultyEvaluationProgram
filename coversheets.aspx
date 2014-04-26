<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="coversheets.aspx.cs" Inherits="coversheets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Cover Sheets</h2>
    
    <label>Term:</label>
    
    <asp:DropDownList ID="termDropDownList" runat="server">
        <asp:ListItem>--default to current term--</asp:ListItem>
    </asp:DropDownList>

    <p>A gridview will display all classes that are flagged for evaluation.</p>
    
    <asp:Button ID="printCoverSheetsButton" runat="server" Text="Print" />    

</asp:Content>

