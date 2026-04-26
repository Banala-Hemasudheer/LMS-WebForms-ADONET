<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTests.aspx.cs" Inherits="My_WebForm1.Faculty.ManageTests" %>

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
/*    .auto-style3 {            class="auto-style3"
        width: 50%;
    }*/
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
                                <td colspan="2" style="text-align: center">Test Details</td>
                            </tr>
                            <tr>
                                <td class="auto-style2" >Test Name:</td>
                                <td>
                                    <asp:TextBox ID="TxtTestName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" >Select Course:</td>
                                <td class="auto-style5">
                                    <asp:DropDownList ID="DdlCourseList" runat="server" DataSourceID="CourseMasterSource" DataTextField="CourseName" DataValueField="Id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CourseMasterSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT 0 AS Id, 'Select Your Course' AS CourseName UNION SELECT ID, CourseName FROM CourseMaster"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Total Questions:</td>
                                <td>
                                    <asp:TextBox ID="TxtNoOfQuestions" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Duration(In Mins):</td>
                                <td>
                                    <asp:TextBox ID="TxtMins" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="LblTestError" runat="server" ForeColor="#33CC33" style="text-align: right" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="BtnTextAdd" runat="server" Text="Add" OnClick="BtnTestAdd_Click" />
                                </td>
                            </tr>
                        </table>
                    
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">
                                <asp:GridView HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TestMasterSource" style="text-align: center" >
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                        <asp:BoundField DataField="TotalQuestions" HeaderText="TotalQuestions" SortExpression="TotalQuestions" />
                                        <asp:BoundField DataField="CourseId" HeaderText="CourseId" SortExpression="CourseId" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="TestMasterSource" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [TestMaster]" DeleteCommand="DELETE FROM [TestMaster] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TestMaster] ([Name], [Duration], [TotalQuestions], [CourseId]) VALUES (@Name, @Duration, @TotalQuestions, @CourseId)" UpdateCommand="UPDATE [TestMaster] SET [Name] = @Name, [Duration] = @Duration, [TotalQuestions] = @TotalQuestions, [CourseId] = @CourseId WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <%--<InsertParameters>
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="Duration" Type="Int32" />
                                        <asp:Parameter Name="TotalQuestions" Type="Int32" />
                                        <asp:Parameter Name="CourseId" Type="Int32" />
                                    </InsertParameters>--%>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="Duration" Type="Int32" />
                                        <asp:Parameter Name="TotalQuestions" Type="Int32" />
                                        <asp:Parameter Name="CourseId" Type="Int32" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>
             </div>
    </form>
</body>
</html>




