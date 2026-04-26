<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMaterial.aspx.cs" Inherits="My_WebForm1.Faculty.ManageMaterial" %>

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
                            <table  class="auto-style1">
                                <tr>
                                    <td style="text-align: center" colspan="2"><strong>Select The Course & add the respective materials</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Select the Course: </td>
                                    <td>
                                        <asp:DropDownList ID="DdlCourseList" AutoPostBack="true" runat="server" DataSourceID="DsCourseMaster" DataTextField="CourseName" DataValueField="Id" OnSelectedIndexChanged="DdlCourseList_SelectedIndexChanged">
                <%-- AutoPostBack="true"=> Postback occurs, Parameter updates, Grid refreshes - GVCourseMaterial Refreshes --%>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DsCourseMaster" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT 0 AS Id, 'Select Course' AS CourseName UNION SELECT ID, CourseName FROM CourseMaster"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Enter the Module name: </td>
                                    <td>
                                        
                                        <asp:TextBox ID="TxtModuleName" runat="server"></asp:TextBox>                                   
                                     </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Upload the material: </td>
                                    <td>              
                                        <asp:FileUpload ID="FileUploadMaterial" runat="server" />
                                     </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Click on Upload:</td>
                                    <td>
                                        
                                        <asp:Button ID="BtnUploadFile" runat="server" Text="Upload" OnClick="BtnUploadFile_Click" />
                                        <asp:Label ID="LblUpload" runat="server"></asp:Label>
                                        <asp:HiddenField ID="HddnFldOnFileName" runat="server" />
                                     </td>
                                </tr>
                                <tr><td colspan="2" style="text-align: center"></td></tr>     
                                <tr>
                                    <td colspan="2" style="text-align: center" > 
                                        <asp:Button ID="BtnAddCourseMaterial" runat="server" style="text-align: center" Text="Add Course Material" OnClick="BtnAddCourseMaterial_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">&nbsp;<asp:Label ID="LblError" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: left; font-weight: 700;">Available Materials:</td>
                                </tr>
                                <tr align="center">
                                    <td colspan="2" style="text-align: center">
                                        <asp:GridView ID="GVCourseMaterial" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="DsCourseMaterial" ForeColor="#333333" GridLines="None" style="text-align: left">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                                <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
                                                <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
                                                <asp:BoundField DataField="RefPDFPath" HeaderText="RefPDFPath" SortExpression="RefPDFPath" />
                                                <asp:BoundField DataField="CourseId" HeaderText="CourseId" SortExpression="CourseId" />
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
                                        <asp:SqlDataSource ID="DsCourseMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [CourseMaterial] WHERE ([CourseId] = @CourseId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DdlCourseList" DefaultValue="0" Name="CourseId" PropertyName="SelectedValue" Type="Int32" />
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
