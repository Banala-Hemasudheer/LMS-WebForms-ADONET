<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="My_WebForm1.Student_.StudentLogin" %>

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
                <td colspan="2" style="text-align: center">Student Login</td>
            </tr>
            <tr>
                <td class="auto-style2">Student Name:&nbsp; </td>
                <td class="auto-style3">
                    <asp:TextBox ID="TxtStudName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TxtStudPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LblStudLogin" runat="server" style="text-align: right" Visible="False"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Button ID="BtnStudLogin" runat="server" OnClick="BtnStudLogin_Click" Text="Login" />
                </td>
            </tr>
        </table>

    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="My_WebForm1.Student_.StudentLogin"  %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>

    <style>

        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
        }

        .login-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: white;
            padding: 35px 30px;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        .login-title {
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #2a5298;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .input-group input:focus {
            border-color: #2a5298;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #2a5298;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background-color: #1e3c72;
        }

        .message {
            color: red;
            font-size: 13px;
            margin-bottom: 10px;
            text-align: center;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="login-container">
            <div class="login-card">

                <div class="login-title">Student Login</div>

                <div class="input-group">
                    <label>Student Name</label>
                    <asp:TextBox ID="TxtStudName" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <asp:TextBox ID="TxtStudPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Label ID="LblStudLogin" runat="server" CssClass="message" Visible="False"></asp:Label>

                <asp:Button ID="BtnStudLogin" 
                    runat="server" 
                    Text="Login" 
                    CssClass="login-btn"
                    OnClick="BtnStudLogin_Click" />

            </div>
        </div>

    </form>
</body>
</html>

