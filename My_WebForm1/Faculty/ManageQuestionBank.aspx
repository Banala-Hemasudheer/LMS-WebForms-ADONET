<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageQuestionBank.aspx.cs" Inherits="My_WebForm1.Faculty.ManageQuestionBank" %>

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
        }
        .auto-style3 {
            text-align: left;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <table border="1" border-color="blue" cell-spacing="0" width="100%">
     <tr>
                                                              <%--<%=Session["facultyname"] %>--%> 
         <td colspan="2"><h2>Welcome <%=Session["FacultyName"] %>  </h2></td>
        
     </tr>
     <tr>
         <td width="20%" align="center" valign="top">
             <a href="ManageCourse.aspx">Manage Courses</a> <br />
             <a href="ManageMaterial.aspx">Manage Materials</a> <br />
             <a href="ManageTests.aspx">Manage Tests</a> <br />
             <a href="ManageQuestionBank.aspx">Manage Question Bank</a> 
         </td>
         <td width="80%">

             <%---- Entire page pasted here--%>

                        <table class="auto-style1">
                            <tr>
                                <td colspan="2" style="text-align: center">Modify Questions</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Select a Test:</td>
                                <td>
                                    <asp:DropDownList ID="DdlTest" runat="server" DataSourceID="TestMasterSource" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DdlTest_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="TestMasterSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="Select 0 as Id, 'Select your Test' as Name
            union
            select Id, Name from TestMaster"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Question:</td>
                                <td>
                                    <asp:TextBox ID="TxtQuestion" runat="server" Height="46px" TextMode="MultiLine" Width="225px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Answer1:</td>
                                <td>
                                    <asp:TextBox ID="TxtAns1" runat="server" Height="49px" TextMode="MultiLine" Width="223px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Answer2;</td>
                                <td>
                                    <asp:TextBox ID="TxtAns2" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Answer3:</td>
                                <td>
                                    <asp:TextBox ID="TxtAns3" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Answer4:</td>
                                <td>
                                    <asp:TextBox ID="TxtAns4" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Correct Answer:</td>
                                <td>
                                    <asp:DropDownList ID="DdlCorrectAns" runat="server">
                                        <asp:ListItem Value="0">Select Your Answer</asp:ListItem>
                                        <asp:ListItem Value="1">Answer 1</asp:ListItem>
                                        <asp:ListItem Value="2">Answer 2</asp:ListItem>
                                        <asp:ListItem Value="3">Answer 3</asp:ListItem>
                                        <asp:ListItem Value="4">Answer 4</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Explanation:</td>
                                <td>
                                    <asp:TextBox ID="TxtExplain" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="LblError" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="BtnAddTest" runat="server" Text="Add Test" OnClick="BtnAddTest_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Existing Questions:</td>
                                <td class="auto-style4"></td>
                            </tr>
                            <tr align="center">
                                <td class="auto-style2" colspan="2" >
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TestQuestionsSource">
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                                            <asp:BoundField DataField="Answer1" HeaderText="Answer1" SortExpression="Answer1" />
                                            <asp:BoundField DataField="Answer2" HeaderText="Answer2" SortExpression="Answer2" />
                                            <asp:BoundField DataField="Answer3" HeaderText="Answer3" SortExpression="Answer3" />
                                            <asp:BoundField DataField="Answer4" HeaderText="Answer4" SortExpression="Answer4" />
                                            <asp:BoundField DataField="CorrectAnswer" HeaderText="CorrectAnswer" SortExpression="CorrectAnswer" />
                                            <asp:BoundField DataField="Explanation" HeaderText="Explanation" SortExpression="Explanation" />
                                            <asp:BoundField DataField="TestId" HeaderText="TestId" SortExpression="TestId" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="TestQuestionsSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [TestQuestions] WHERE ([TestId] = @TestId)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DdlTest" DefaultValue="1" Name="TestId" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>

        </td>
       </tr>
     </table>

        </div>
    </form>
</body>
</html>
