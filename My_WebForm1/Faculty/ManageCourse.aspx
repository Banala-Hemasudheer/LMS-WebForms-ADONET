<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCourse.aspx.cs" Inherits="My_WebForm1.Faculty.ManageCourse" %>

<%--Add .js file to prevent browser back button after logout--%><%--Force refresh on page load to prevent caching--%>
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
            text-align: right;
            width: 730px;
        }
        .auto-style3 {
            width: 730px;
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
            width: 730px;
            height: 29px;
        }
        .auto-style5 {
            height: 29px;
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
        <div>
            <table border="1" border-color="blue" cell-spacing="0" width="100%">
                <tr>
                    <%--<%=Session["facultyname"] %>--%>  
                    <td class="center-label" colspan="2"><h2>Welcome <% =Session["FacultyName"] %>
                        <asp:Button class="logout-btn" ID="FacLogOutBtn1" runat="server" OnClick="FacLogOut_Clk" Text="Log Out" />
                        </h2>

                    </td>
                </tr>

                <tr>
                    <td width="20%" align="center" valign="top">
                        <a href="ManageCourse.aspx">Manage Courses</a>
                        <br />
                        <a href="ManageMaterial.aspx">Manage Materials</a>
                        <br />
                        <a href="ManageTests.aspx">Manage Tests</a>
                        <br />
                        <a href="ManageQuestionBank.aspx">Manage Question Bank</a>
                                                
                    </td>
                    <td width="80%">

                        <%--Content--%>

                        <table class="auto-style1">
                            <tr>
                                <td colspan="2" style="text-align: center">Course Details</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Course Name:</td>
                                <td>
                                    <asp:TextBox ID="TxtCourseName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Description:</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="TxtDescription" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Modules:</td>
                                <td>
                                    <asp:TextBox ID="TxtModules" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Duration (In Years):</td>
                                <td>
                                    <asp:TextBox ID="TxtYears" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="LblCourseError" runat="server" ForeColor="#33CC33" Style="text-align: right" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="BtnCourseAdd" runat="server" Text="Add" OnClick="BtnCourseAdd_Click" />
                                </td>
                            </tr>
                        </table>


                        <table class="auto-style1">
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">

                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="CourseMasterList" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                            <asp:BoundField DataField="Modules" HeaderText="Modules" SortExpression="Modules" />
                                            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="CourseMasterList" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString2 %>" DeleteCommand="DELETE FROM [CourseMaster] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CourseMaster] ([CourseName], [Description], [Modules], [Duration]) VALUES (@CourseName, @Description, @Modules, @Duration)" ProviderName="<%$ ConnectionStrings:LMSConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [CourseMaster]" UpdateCommand="UPDATE [CourseMaster] SET [CourseName] = @CourseName, [Description] = @Description, [Modules] = @Modules, [Duration] = @Duration WHERE [ID] = @ID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </DeleteParameters>

                                        <%--Using Insert option - In Grid, Tricky & Complex Not preferred.--%>
                                        <%--<InsertParameters>--%>
                                        <%--<asp:Parameter Name="CourseName" Type="String" />--%>
                                        <%--<asp:Parameter Name="Description" Type="String" />--%>
                                        <%--<asp:Parameter Name="Modules" Type="String" />--%>
                                        <%--<asp:Parameter Name="Duration" Type="Int32" />--%>
                                        <%--</InsertParameters>--%>

                                        <UpdateParameters>
                                            <asp:Parameter Name="CourseName" Type="String" />
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="Modules" Type="String" />
                                            <asp:Parameter Name="Duration" Type="Int32" />
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </UpdateParameters>
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
