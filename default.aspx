<%@ Page Title="" Language="C#" MasterPageFile="~/FEP.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" Runat="Server">
    <h1>Faculty Evaluation Program</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContent" Runat="Server">
    
    <asp:Panel ID="logInPanel" runat="server">
        <asp:Login ID="Login" runat="server"></asp:Login>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="aboutPanel">
       <p>About stuff goes here.</p>        
    </asp:Panel>

</asp:Content>