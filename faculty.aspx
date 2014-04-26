<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="faculty.aspx.cs" Inherits="faculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    <h2>Faculty</h2>
        <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [FACULTY] WHERE [EID] = @EID" InsertCommand="INSERT INTO [FACULTY] ([Name], [Email], [Status], [EID]) VALUES (@Name, @Email, @Status, @EID)" SelectCommand="SELECT [Name], [Email], [Status], [EID] FROM [FACULTY] ORDER BY [Name]" UpdateCommand="UPDATE [FACULTY] SET [Name] = @Name, [Email] = @Email, [Status] = @Status WHERE [EID] = @EID">
            <DeleteParameters>
                <asp:Parameter Name="EID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="EID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="EID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EID" DataSourceID="FacultyDataSource">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm(&quot;Okay to DELETE?&quot;)"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <p>This section will have a gridview that will display all information for faculty members in the database.  Users will be able to edit or delete any entry in the table to make corrections.</p>
</asp:Content>

