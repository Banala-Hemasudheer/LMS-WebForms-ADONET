<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="My_WebForm1.Student_.StudentHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="LblStudHome" runat="server" style="text-align: center"> </asp:Label>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Your Course Details:</td>
                    <td>
                    <asp:DataList ID="DLCourseDetails" runat="server" CellPadding="2" DataKeyField="ID" DataSourceID="StudCourseDetailsSource" ForeColor="Black" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" style="text-align: left">
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <ItemTemplate>
                            ID:
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                            <br />
                            Description:
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            Modules:
                            <asp:Label ID="ModulesLabel" runat="server" Text='<%# Eval("Modules") %>' />
                            <br />
                            Duration:
                            <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                            <br />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="StudCourseDetailsSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [CourseMaster] WHERE ([ID] = @ID)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="ID" SessionField="courseid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                    <%--<td>&nbsp;</td>--%>
                </tr>
<%--<tr>
                    <td  class="auto-style2">Your Course Material links:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Your Test Attempts:</td>
                    <td>
                        <asp:GridView ID="GridViewTWA" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Select a Test to Attempt:</td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="DdlTestId" runat="server" DataSourceID="StudTestsSource" DataTextField="Name" DataValueField="Id" style="text-align: right">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="StudTestsSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [TestMaster] WHERE ([CourseId] = @CourseId)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="1" Name="CourseId" SessionField="courseid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="text-align: left">
                        <asp:LinkButton ID="LBtnAttemptTest" runat="server" OnClick="LBtnAttemptTest_Click" style="text-align: left">Attempt Test</asp:LinkButton>
                    </td>
                </tr>
            </table>
    
        </div>
    </form>
</body>
</html>--%--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="My_WebForm1.Student_.StudentHome" %>

<%--Adding the reference to the JavaScript file for StudentHome page:--%>
<script src="StudentHome.js"></script> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>

    <style>

        body {
            margin: 0;
            font-family: "Segoe UI", Arial;
            background-color: #f4f6f9;
        }

        .container {
            width: 85%;
            margin: 30px auto;
        }

        .welcome {
            display: flex;
            align-items: center;
            justify-content: center; /* centers label */
            position: relative;
            height: 60px; /* adjust as needed */

            text-align: center;
            font-size: 22px;
            font-weight: 600;
            color: #2a5298;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .card h3 {
            margin-top: 0;
            color: #1e3c72;
        }

        /* DataList styling */
        .course-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        /* GridView styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th {
            background-color: #2a5298;
            color: white;
            padding: 8px;
        }

        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }

        /* Dropdown */
        select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Button */
        .btn {
            background-color: #2a5298;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #1e3c72;
        }

        /*logout button*/

        .center-label {
            text-align: center;
        }

        .logout-btn {
            position: absolute;
            right: 10px; /* moves button to right corner */

                background-color: white;      /* white fill */
                color: #5bc0de;               /* light blue text */
                border: 2px solid #5bc0de;    /* light blue border */
                padding: 6px 14px;
                border-radius: 5px;
                cursor: pointer;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <!-- Welcome -->
            <div class="welcome">
                <asp:Label ID="LblStudHome" runat="server" CssClass="center-label"></asp:Label>
                <asp:Button ID="LogOutBtn" runat="server" Text="Log Out" ValidateRequestMode="Disabled" CssClass="logout-btn" OnClick="LogOutBtn_Click" />
            </div>

            <!-- Course Details -->
            <div class="card">
                <h3>Your Course Details</h3>

                <asp:DataList ID="DLCourseDetails" runat="server" DataKeyField="ID"
                    DataSourceID="StudCourseDetailsSource">

                    <ItemTemplate>
                        <div class="course-item">
                            <b>Course:</b> <%# Eval("CourseName") %> <br />
                            <b>Description:</b> <%# Eval("Description") %> <br />
                            <b>Modules:</b> <%# Eval("Modules") %> <br />
                            <b>Duration:</b> <%# Eval("Duration") %>
                        </div>
                    </ItemTemplate>

                </asp:DataList>

                <asp:SqlDataSource ID="StudCourseDetailsSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                    SelectCommand="SELECT * FROM [CourseMaster] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="courseid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <!-- Test Attempts -->
            <div class="card">
                <h3>Your Test Attempts</h3>

                <asp:GridView ID="GridViewTWA" runat="server" CssClass="gridview"></asp:GridView>
            </div>

            <!-- Attempt Test -->
            <div class="card">
                <h3>Attempt a Test</h3>

                <asp:DropDownList ID="DdlTestId" runat="server"
                    DataSourceID="StudTestsSource"
                    DataTextField="Name"
                    DataValueField="Id">
                </asp:DropDownList>

                <br />

                <asp:LinkButton ID="LBtnAttemptTest" runat="server"
                    CssClass="btn"
                    OnClick="LBtnAttemptTest_Click">
                    Start Test
                </asp:LinkButton>

                <asp:SqlDataSource ID="StudTestsSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                    SelectCommand="SELECT * FROM [TestMaster] WHERE ([CourseId] = @CourseId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="CourseId" SessionField="courseid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

        </div>

    </form>
</body>
</html>



