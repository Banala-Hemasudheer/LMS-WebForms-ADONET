<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentTestSummary.aspx.cs" Inherits="My_WebForm1.Student_.StudentTestSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 180px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="text-align: center">Welcome to Test Summary - <%=Session["studName"] %></td>
                </tr>
                <tr>
                    <td class="auto-style2">Test Summary:</td>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="DsTestSummary">
                            <ItemTemplate>
                                Id:
                                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                <br />
                                StudentId:
                                <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                                <br />
                                TestId:
                                <asp:Label ID="TestIdLabel" runat="server" Text='<%# Eval("TestId") %>' />
                                <br />
                                AttemptDate:
                                <asp:Label ID="AttemptDateLabel" runat="server" Text='<%# Eval("AttemptDate") %>' />
                                <br />
                                Result:
                                <asp:Label ID="ResultLabel" runat="server" Text='<%# Eval("Result") %>' />
                                <br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="DsTestSummary" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [TestSummary] WHERE (([TestId] = @TestId) AND ([StudentId] = @StudentId))">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="1" Name="TestId" SessionField="testid" Type="Int32" />
                                <asp:SessionParameter DefaultValue="1" Name="StudentId" SessionField="studid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Test Attempt Details:</td>
                    <td>
                        <asp:SqlDataSource ID="DsStudentAttemptDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
                            SelectCommand="SELECT TQ.Question, SAD.SelectedAns, TQ.CorrectAnswer, TQ.Explanation, SAD.IsCorrect FROM TestQuestions AS TQ INNER JOIN StudentAttemptDetails AS SAD ON TQ.Id = SAD.TestQuestionId WHERE (TQ.TestId = @TestId) AND (SAD.StudentId = @StudentId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="TestId" SessionField="testid" Type="Int32" DefaultValue="1" />
                                <asp:SessionParameter Name="StudentId" SessionField="studid" Type="Int32" DefaultValue="1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GVTestAttemptDetails" runat="server" DataKeyField="Id" DataSourceID="DsStudentAttemptDetails">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

                                        <%--Styled Version--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentTestSummary.aspx.cs" Inherits="My_WebForm1.Student_.StudentTestSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Summary</title>

    <style type="text/css">

        body {
            font-family: "Segoe UI", Arial;
            background-color: #f4f6f9;
            margin: 0;
        }

        .container {
            width: 85%;
            margin: 30px auto;
        }

        .header {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #2a5298;
            margin-bottom: 20px;
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

        .summary-item {
            padding: 6px 0;
        }

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

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <!-- HEADER -->
            <div class="header">
                Welcome to Test Summary - <%= Session["studName"] %>
            </div>

            <!-- TEST SUMMARY -->
            <div class="card">

                <h3>Test Summary</h3>

                <asp:DataList ID="DataList1" runat="server"
                    DataSourceID="DsTestSummary">

                    <ItemTemplate>

                        <div class="summary-item">
                            <b>Test Id:</b> <%# Eval("TestId") %>
                        </div>

                        <div class="summary-item">
                            <b>Student Id:</b> <%# Eval("StudentId") %>
                        </div>

                        <div class="summary-item">
                            <b>Attempt Date:</b> <%# Eval("AttemptDate") %>
                        </div>

                        <div class="summary-item">
                            <b>Result:</b> 
                            <span style="color:green;font-weight:bold;">
                                <%# Eval("Result") %>
                            </span>
                        </div>

                        <hr />

                    </ItemTemplate>

                </asp:DataList>

                <!-- DATA SOURCE (MUST BE SAME NAME AS ABOVE) -->
                <asp:SqlDataSource ID="DsTestSummary" runat="server"
                    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                    SelectCommand="SELECT * FROM TestSummary WHERE TestId = @TestId AND StudentId = @StudentId">

                    <SelectParameters>
                        <asp:SessionParameter Name="TestId" SessionField="testid" Type="Int32" />
                        <asp:SessionParameter Name="StudentId" SessionField="studid" Type="Int32" />
                    </SelectParameters>

                </asp:SqlDataSource>

            </div>

            <!-- TEST DETAILS -->
            <div class="card">

                <h3>Test Attempt Details</h3>

                <asp:GridView ID="GVTestAttemptDetails" runat="server"
                    DataSourceID="DsStudentAttemptDetails"
                    AutoGenerateColumns="True"
                    CssClass="gridview">

                </asp:GridView>

                <!-- DETAILS DATA SOURCE -->
                <asp:SqlDataSource ID="DsStudentAttemptDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                    SelectCommand="
                        SELECT 
                            TQ.Question,
                            SAD.SelectedAns,
                            TQ.CorrectAnswer,
                            TQ.Explanation,
                            SAD.IsCorrect
                        FROM TestQuestions TQ
                        INNER JOIN StudentAttemptDetails SAD 
                            ON TQ.Id = SAD.TestQuestionId
                        WHERE TQ.TestId = @TestId 
                        AND SAD.StudentId = @StudentId">

                    <SelectParameters>
                        <asp:SessionParameter Name="TestId" SessionField="testid" Type="Int32" />
                        <asp:SessionParameter Name="StudentId" SessionField="studid" Type="Int32" />
                    </SelectParameters>

                </asp:SqlDataSource>

            </div>

        </div>

    </form>
</body>
</html>--%>