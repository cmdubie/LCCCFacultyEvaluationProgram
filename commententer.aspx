<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commententer.aspx.cs" Inherits="Commententer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link href="css/commententer.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <h2>Enter Comments</h2>

    <p>Select a term and class/section to enter comments for that class/section.</p>
    <p>After entering a comment, use [Tab] and [Enter] to submit the comment.</p>

    <label>Term:</label>
    
    <asp:SqlDataSource ID="termSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]" ></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TermDDLIndexChangedEvent" AppendDataBoundItems="True" DataSourceID="termSqlDataSource" DataTextField="Term" DataValueField="Term">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:SqlDataSource ID="classSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CourseID + ' - ' + Section AS ClassSection, ClassNum
from COURSESECTION AS cs
where Term = @TermSource
order by ClassSection">
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="TermSource" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="classDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="classSqlDataSource" DataTextField="ClassSection" DataValueField="ClassNum" OnSelectedIndexChanged="ClassDDLIndexChangedEvent" AutoPostBack="True">
        <asp:ListItem Value="-1">--select a class/section--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:panel runat="server" id="commentTextBoxPanel" DefaultButton="addCommentButton">
        
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
                 
        <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("StudentComments") %>' TextMode="MultiLine" Columns="90" Rows="10" ClientIDMode="Static" />

        <p class="errorMessageParagraph"><asp:Label ID="insertMessageLabel" CssClass="messageLabel" runat="server"></asp:Label></p>
        <p class="errorMessageParagraph"><asp:Label runat="server" ID="exceptionMessageLabel" CssClass="messageLabel"></asp:Label></p>
        
        <p id="charactersMessage">Max characters - 255: <label id="lblCharLeft"></label></p>
        
         <script type="text/javascript">
             var maxLength = 255; // change here to change the max limit
             // write the character left message
             $(document).ready(function () {
                 $("#lblCharLeft").text(maxLength + " characters left");
             });
              
             // limit the characters
             $("#CommentTextBox").keyup(function () {
                 var text = $(this).val();
                 var textLength = text.length;
                 if (textLength > maxLength) {
                     $(this).val(text.substring(0, (maxLength)));
                     alert("Sorry, only " + maxLength + " characters are allowed");
                 }
                 else {
                     $("#lblCharLeft").text((maxLength - textLength) + " characters left.");
                 }
             });
        </script>
        
        <asp:Button ID="addCommentButton" runat="server" Text="Add Comment" OnClick="addCommentButton_Click" />
        
    </asp:panel>

</asp:Content>

