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
