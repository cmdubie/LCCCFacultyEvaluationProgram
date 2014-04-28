<%@ Page Title="" Language="C#" MasterPageFile="~/data.master" AutoEventWireup="true" CodeFile="section.aspx.cs" Inherits="Section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/gridview.css"/>
    <link rel="stylesheet" type="text/css" href="css/section.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inlineNavSub" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContentSub" Runat="Server">
    
    <h2>Class/Section</h2>
    
    <p>Select a term to view class/sections for that term.</p>
    <p>Use the edit function to adjust the number of enrolled students or change the evaluation status.</p>

    <label>Term:</label>

    <asp:SqlDataSource ID="TermDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Term] FROM [COURSESECTION]"></asp:SqlDataSource>
    
    <asp:DropDownList ID="termDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="TermDataSource" DataTextField="Term" DataValueField="Term" AutoPostBack="True" OnSelectedIndexChanged="StickyTermSelected">
        <asp:ListItem Value="-1">--select a term--</asp:ListItem>
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="ClassGVSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT f.Name, cs.Term, cs.ClassNum, cs.CourseID, c.Title, cs.Section, cs.Evaluation, cs.NumberStudents 
FROM COURSESECTION AS cs INNER JOIN 
     COURSE AS c ON cs.CourseID = c.CourseID LEFT OUTER JOIN 
     FACULTY AS f ON cs.EID = f.EID
WHERE (cs.Term = @Param1)
ORDER BY cs.ClassNum" UpdateCommand="UPDATE COURSESECTION SET NumberStudents = @NumberStudents, Evaluation = @Evaluation WHERE (ClassNum = @ClassNum) AND (Term = @Term)" >
        <SelectParameters>
            <asp:ControlParameter ControlID="termDropDownList" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumberStudents" />
            <asp:Parameter Name="Evaluation" Type="Char" />
            <asp:Parameter Name="ClassNum" />
            <asp:Parameter Name="Term" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ClassSectionGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Term,ClassNum" DataSourceID="ClassGVSqlDataSource">
        <Columns>
            <asp:BoundField DataField="ClassNum" HeaderText="No." ReadOnly="True" SortExpression="ClassNum" />
            <asp:TemplateField HeaderText="Course" SortExpression="CourseID">
                <EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("CourseID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sect." SortExpression="Section">
                <EditItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Section") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Instructor" SortExpression="Name">
                <EditItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enrolled" SortExpression="NumberStudents">
                <EditItemTemplate>
                    <asp:DropDownList ID="EnrolledDropDownList" runat="server" SelectedValue='<%# Bind("NumberStudents") %>' >
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                        <asp:ListItem>32</asp:ListItem>
                        <asp:ListItem>33</asp:ListItem>
                        <asp:ListItem>34</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>36</asp:ListItem>
                        <asp:ListItem>37</asp:ListItem>
                        <asp:ListItem>38</asp:ListItem>
                        <asp:ListItem>39</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>41</asp:ListItem>
                        <asp:ListItem>42</asp:ListItem>
                        <asp:ListItem>43</asp:ListItem>
                        <asp:ListItem>44</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>46</asp:ListItem>
                        <asp:ListItem>47</asp:ListItem>
                        <asp:ListItem>48</asp:ListItem>
                        <asp:ListItem>49</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("NumberStudents") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Eval?" SortExpression="Evaluation">
                <EditItemTemplate>
                    <asp:DropDownList ID="EvalDropDownList" runat="server" SelectedValue='<%# Bind("Evaluation") %>'>
                        <asp:ListItem>Y</asp:ListItem>
                        <asp:ListItem>N</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Evaluation") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>   
</asp:Content>

