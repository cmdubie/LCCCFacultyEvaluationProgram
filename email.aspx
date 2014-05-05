<%@ Page Title="" Language="C#" MasterPageFile="~/report.master" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link href="css/gridview.css" rel="stylesheet" type="text/css"/>
    <link href="css/email.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Email</h2>
    
    <p>Select a term to display all full-time faculty with a class for that term.</p>
    <p>Select the button to send emails to the faculty displayed.</p>
    
    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>

    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="TermDDLIndexChangedEvent">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>  
    
    <asp:Button ID="sendMailButton" runat="server" Text="Send Emails" Enabled="false" />
    
    <p><asp:Label ID="emailMessageLabel" CssClass="messageLabel" runat="server" Text=""></asp:Label></p>
 
    <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [FACULTY] WHERE [EID] = @EID" InsertCommand="INSERT INTO [FACULTY] ([Name], [Email], [Status], [EID]) VALUES (Name, @Email, Status, @EID)" SelectCommand="SELECT DISTINCT f.Name, f.Email, f.Status, f.EID
FROM Faculty AS f, CourseSection AS cs
WHERE UPPER(f.Status) = 'F' AND f.EID = cs.EID AND Term = @Term
ORDER BY f.Name">
        <DeleteParameters>
        </DeleteParameters>
        <InsertParameters>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Term" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EID" DataSourceID="FacultyDataSource">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="EID" HeaderText="Empolyee Number" ReadOnly="True" SortExpression="EID" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
    </asp:GridView>   
</asp:Content>

