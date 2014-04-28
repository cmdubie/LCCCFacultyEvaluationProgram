<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commententer.aspx.cs" Inherits="commententer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link href="css/commententer.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <h2>Enter Comments</h2>

    <label>Term:</label>
    
    <asp:SqlDataSource ID="termSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]" ></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="StickyTermSelected" AppendDataBoundItems="True" DataSourceID="termSqlDataSource" DataTextField="Term" DataValueField="Term">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>

    <asp:SqlDataSource ID="classSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CourseID + ' - ' + Section AS ClassSection, ClassNum
from COURSESECTION AS cs
where Term = @Term
order by ClassSection">
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="classDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="classSqlDataSource" DataTextField="ClassSection" DataValueField="ClassNum" OnSelectedIndexChanged="EnableAddCommentButton" AutoPostBack="True">
        <asp:ListItem Value="-1">--select a class/section--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:panel runat="server" id="commentTextBoxPanel" DefaultButton="addCommentButton">
        
        <asp:TextBox ID="commentTextBox" runat="server" TextMode="MultiLine" Wrap="True"></asp:TextBox>
        <asp:Button ID="addCommentButton" runat="server" Text="Add Comment" OnClick="addCommentButton_Click" />

    </asp:panel>

</asp:Content>

