<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" Inherits="My_WebForm1.Faculty.FacultyLogin" %>

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
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" Inherits="My_WebForm1.Faculty.FacultyLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Login</title>

    <style>

        body {
            margin: 0;
            font-family: "Segoe UI", Arial;
            background: linear-gradient(135deg, #141e30, #243b55);
        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: white;
            padding: 35px;
            width: 360px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .title {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #243b55;
            margin-bottom: 25px;
        }

        .input-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            border-color: #243b55;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #243b55;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #141e30;
        }

        .error {
            color: red;
            font-size: 13px;
            text-align: center;
            margin-top: 10px;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <div class="login-card">

                <div class="title">Faculty Portal Login</div>

                <div class="input-group">
                    <label>Faculty Name</label>
                    <asp:TextBox ID="TxtFacutlyName" runat="server"></asp:TextBox>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <asp:TextBox ID="TxtFacultyPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Label ID="LblFacultyLogin" runat="server" CssClass="error" Visible="False"></asp:Label>

                <asp:Button ID="BtnFacultyLogin" 
                    runat="server" 
                    Text="Login"
                    CssClass="btn"
                    OnClick="BtnFacultyLogin_Click" />

            </div>

        </div>

    </form>
</body>
</html>
