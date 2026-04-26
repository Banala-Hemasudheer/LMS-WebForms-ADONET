<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="My_WebForm1.Student_.StudentHome" %>

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
                <tr>
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
</html>
