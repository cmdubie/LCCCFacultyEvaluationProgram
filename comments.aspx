<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="comments.aspx.cs" Inherits="Commentview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link rel="stylesheet" type="text/css" href="css/comments.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>View Comments</h2>
    
    <p>Select a term and class/section to view the comments.</p>
    <p>Use the edit function to make any corrections to the comments.</p>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>

    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="TermDDLIndexChangedEvent">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:SqlDataSource ID="classDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CourseID + ' - ' + Section AS ClassSection, ClassNum
from COURSESECTION AS cs
where Term = @Term and UPPER(Evaluation) = 'Y'
order by ClassSection" >
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="classDropDownList" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="classDataSource" DataTextField="ClassSection" DataValueField="ClassNum" >
        <asp:ListItem Value="-1">--select a class/section--</asp:ListItem>
    </asp:DropDownList>

    <asp:panel runat="server" id="commentTextBoxPanel" DefaultButton="addCommentButton">
        
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
                 
        <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("StudentComments") %>' TextMode="MultiLine" Columns="105" Rows="10" ClientIDMode="Static" />

        <p class="errorMessageParagraph"><asp:Label ID="insertMessageLabel" CssClass="messageLabel" runat="server"></asp:Label></p>
        <p class="errorMessageParagraph"><asp:Label runat="server" ID="exceptionMessageLabel" CssClass="messageLabel"></asp:Label></p>
        
        <p id="charactersMessage">Max characters - 1000: <label id="lblCharLeft"></label></p>
        
         <script type="text/javascript">
             var maxLength = 1000; // change here to change the max limit
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
    
    <asp:SqlDataSource ID="CommentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StudentComments],  CommentID
FROM [COMMENT] 
WHERE (([ClassNum] = @ClassNum) AND ([Term] = @Term)) ORDER BY CommentID DESC" UpdateCommand="update COMMENT
set StudentComments = @StudentComments
where CommentID = @CommentID" DeleteCommand="DELETE FROM COMMENT WHERE (CommentID = @CommentID)">
        <DeleteParameters>
            <asp:Parameter Name="CommentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="classDropDownList" Name="ClassNum" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentComments" />
            <asp:Parameter Name="CommentID" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="CommentViewGridView" runat="server" DataKeyNames="CommentID" AutoGenerateColumns="False" DataSourceID="CommentSqlDataSource">
        <Columns>
            <asp:TemplateField HeaderText="Student Comments" SortExpression="StudentComments">
                <EditItemTemplate>
                    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentComments") %>' TextMode="MultiLine" Columns="100" Rows="3" ClientIDMode="Static" />
                    <p>Max characters - 1000: <label id="lblCharLeft"></label></p>
                    <script type="text/javascript">
                        var maxLength = 1000; // change here to change the max limit
                        // write the character left message
                        $(document).ready(function () {
                            $("#lblCharLeft").text(maxLength + " characters left");
                        });

                        // limit the characters
                        $("#TextBox1").keyup(function () {
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
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentComments") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;|| &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;|| &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm(&quot;Okay to DELETE?&quot;)"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>


