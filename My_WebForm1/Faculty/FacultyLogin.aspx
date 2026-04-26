<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" Inherits="My_WebForm1.Faculty.FacultyLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 50%;
            text-align: right;
        }
        .auto-style3 {
            width: 50%;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
     <table class="auto-style1">
         <tr>
             <td colspan="2" style="text-align: center">Faculty Login</td>
         </tr>
         <tr>
             <td class="auto-style2">Faculty Name:&nbsp; </td>
             <td class="auto-style3">
                 <asp:TextBox ID="TxtFacutlyName" runat="server"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="auto-style2">Password:</td>
             <td class="auto-style3">
                 <asp:TextBox ID="TxtFacultyPassword" runat="server"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="auto-style2">
                 <asp:Label ID="LblFacultyLogin" runat="server" style="text-align: right" Visible="False"></asp:Label>
             </td>
             <td class="auto-style3">
                 <asp:Button ID="BtnFacultyLogin" runat="server" OnClick="BtnFacultyLogin_Click" Text="Login" />
             </td>
         </tr>
     </table>
    </form>
</body>
</html>
