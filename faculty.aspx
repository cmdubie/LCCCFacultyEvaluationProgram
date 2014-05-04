<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="faculty.aspx.cs" Inherits="faculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link rel="stylesheet" type="text/css" href="css/faculty.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <h2>Faculty</h2>
    
    <p>Use the edit function to add or change faculty email and status (full or part-time).</p>
    <p>Use the delete function to remove a faculty member from the database.
        <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [FACULTY] WHERE [EID] = @EID" InsertCommand="INSERT INTO [FACULTY] ([Name], [Email], [Status], [EID]) VALUES (Name, @Email, Status, @EID)" SelectCommand="SELECT [Name], [Email], [Status], [EID] FROM [FACULTY] ORDER BY [Name]" UpdateCommand="UPDATE FACULTY SET Name = Name, Email = @Email, Status = @Status WHERE (EID = @EID)">
            <DeleteParameters>
                <asp:Parameter Name="EID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EID" Type="Int32" />
                <asp:Parameter Name="Status" Type="Char"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="EID" Type="Int32" />
                <asp:Parameter Name="Status" Type="Char"/>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EID" DataSourceID="FacultyDataSource">
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:Label ID="nameEditLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee Number">
                    <EditItemTemplate>
                        <asp:Label ID="eidEditLabel" runat="server" Text='<%# Bind("EID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="eidLabel" runat="server" Text='<%# Bind("EID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="FacultyStatusDDL" runat="server" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem Text="F" Value="F" />
                            <asp:ListItem Text="P" Value="P" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="UpdateLinkButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp; &#45; &nbsp;<asp:LinkButton ID="CancelLinkButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;|| &nbsp;<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm(&quot;Okay to DELETE?&quot;)"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>

