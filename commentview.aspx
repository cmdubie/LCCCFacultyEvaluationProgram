<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="commentview.aspx.cs" Inherits="Commentview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link rel="stylesheet" type="text/css" href="css/commentview.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>View Comments</h2>
    
    <p>Select a term and class/section to view the comments.</p>
    <p>Use the edit function to make any corrections to the comments.</p>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>

    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="StickyTermSelected">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <label>Class/Section:</label>
    
    <asp:SqlDataSource ID="classDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CourseID + ' - ' + Section AS ClassSection, ClassNum
from COURSESECTION AS cs
where Term = @Term
order by ClassSection">
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="classDropDownList" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="classDataSource" DataTextField="ClassSection" DataValueField="ClassNum" >
        <asp:ListItem Value="-1">--select a class/section--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="CommentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StudentComments],  CommentID
FROM [COMMENT] 
WHERE (([ClassNum] = @ClassNum) AND ([Term] = @Term))" UpdateCommand="update COMMENT
set StudentComments = @StudentComments
where CommentID = @CommentID">
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
                    <script type="text/javascript" language="Javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.4.1.min.js"></script>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentComments") %>' TextMode="MultiLine" Columns="100" Rows="3" ClientIDMode="Static" />
                    <p>Max characters - 255: <label id="lblCharLeft"></label></p>
                    <script language="javascript" type="text/javascript">
                        var maxLength = 255; // change here to change the max limit
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
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>

</asp:Content>


