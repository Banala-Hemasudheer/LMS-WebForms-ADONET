<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentTestSummary.aspx.cs" Inherits="My_WebForm1.Student_.StudentTestSummary" %>

<%--Add .js file to prevent browser back button after logout--%>
<%--Force refresh on page load to prevent caching--%>
<script type="text/javascript">
    window.onpageshow = function (event) {
        if (event.persisted) {
            window.location.reload();
        }
    };
</script>

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

      /*Data List Styling*/
      .summary-table {
          border-collapse: collapse;
          width: 80%;
      }
      
      .summary-table th {
          background-color: #5bc0de;
          color: white;
          padding: 8px;
      }
      
      .summary-table td {
          border: 1px solid #ddd;
          padding: 8px;
          text-align: center;
      }

    </style>
</head>
<body>
    <form id="form1" runat="server">
          
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="center-label" colspan="2" style="text-align: center">Welcome to Test Summary - <%=Session["studName"] %>
                        <asp:Button ID="LogOutBtn2" runat="server" Text="Log Out" class="logout-btn" OnClick="LogOutBtn2_Clk" />
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">Test Summary:</td>
                    <td>
                        <%--<asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="DsTestSummary">
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
                            </asp:DataList> --%>
                        
                    <asp:DataList ID="DataList1" runat="server" 
                        DataKeyField="Id" 
                        DataSourceID="DsTestSummary"
                        RepeatLayout="Table"
                        RepeatDirection="Vertical"
                        CssClass="summary-table">
                    
                        <HeaderTemplate>
                            <table class="summary-table">
                                <tr>
                                    <th>Id</th>
                                    <th>Student Id</th>
                                    <th>Test Id</th>
                                    <th>Attempt Date</th>
                                    <th>Result</th>
                                </tr>
                        </HeaderTemplate>
                    
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("StudentId") %></td>
                                <td><%# Eval("TestId") %></td>
                                <td><%# Eval("AttemptDate") %></td>
                                <td><%# Eval("FinalResult") %></td>
                            </tr>
                        </ItemTemplate>
                        
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>                   
                    </asp:DataList>
                        
                        <asp:SqlDataSource ID="DsTestSummary" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT Id, StudentId, TestId, AttemptDate, Case when Result=0 then 'Fail' else 'Pass' end as FinalResult FROM [TestSummary] WHERE (([TestId] = @TestId) AND ([StudentId] = @StudentId))">
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

