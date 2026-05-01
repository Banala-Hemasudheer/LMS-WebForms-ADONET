<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttemptTest.aspx.cs" Inherits="My_WebForm1.Student_.AttemptTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
            text-align: left;
        }
        .auto-style3 {
            width: 50%;
        }
        .auto-style4 {
            width: 40%;
            text-align: right;
        }
        .auto-style5 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="LblAttemptTest" runat="server"></asp:Label>
        </div>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="LblQuestionId" runat="server"></asp:Label>
                    ). Question:&nbsp;
                    <asp:Label ID="LblQuestion" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" >1)&nbsp;
                    <asp:Label ID="LblOption1" runat="server"></asp:Label>
                </td>
                <td>2)&nbsp;
                    <asp:Label ID="LblOption2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" >3)&nbsp;
                    <asp:Label ID="LblOption3" runat="server"></asp:Label>
                </td>
                <td>4)&nbsp;
                    <asp:Label ID="LblOption4" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Select Your Option:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DdlChoosenOption" runat="server">
                        <asp:ListItem Value="0">Select your answer</asp:ListItem>
                        <asp:ListItem Value="1">Option 1</asp:ListItem>
                        <asp:ListItem Value="2">Option 2</asp:ListItem>
                        <asp:ListItem Value="3">Option 3</asp:ListItem>
                        <asp:ListItem Value="4">Option 4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="LblError" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="BtnSubmit" runat="server" Text="Save &amp; Next" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
        </table>
    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttemptTest.aspx.cs" Inherits="My_WebForm1.Student_.AttemptTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attempt Test</title>

    <style>

        body {
            margin: 0;
            font-family: "Segoe UI", Arial;
            background-color: #f4f6f9;
        }

        .container {
            width: 70%;
            margin: 40px auto;
        }

        .test-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .title {
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            color: #2a5298;
            margin-bottom: 20px;
        }

        .question {
            font-size: 18px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .options {
            margin-bottom: 20px;
        }

        .option-item {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-bottom: 10px;
            background-color: #fafafa;
        }

        .option-item:hover {
            background-color: #eef3ff;
        }

        select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 200px;
        }

        .btn {
            background-color: #2a5298;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #1e3c72;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-top: 10px;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="test-card">

                <!-- Title -->
                <div class="title">
                    <asp:Label ID="LblAttemptTest" runat="server"></asp:Label>
                </div>

                <!-- Question -->
                <div class="question">
                    Q<asp:Label ID="LblQuestionId" runat="server"></asp:Label>:
                    <asp:Label ID="LblQuestion" runat="server"></asp:Label>
                </div>

                <!-- Options -->
                <div class="options">
                    <div class="option-item">
                        1) <asp:Label ID="LblOption1" runat="server"></asp:Label>
                    </div>

                    <div class="option-item">
                        2) <asp:Label ID="LblOption2" runat="server"></asp:Label>
                    </div>

                    <div class="option-item">
                        3) <asp:Label ID="LblOption3" runat="server"></asp:Label>
                    </div>

                    <div class="option-item">
                        4) <asp:Label ID="LblOption4" runat="server"></asp:Label>
                    </div>
                </div>

                <!-- Answer Selection -->
                <div>
                    <b>Select Your Answer:</b><br /><br />

                    <asp:DropDownList ID="DdlChoosenOption" runat="server">
                        <asp:ListItem Value="0">Select your answer</asp:ListItem>
                        <asp:ListItem Value="1">Option 1</asp:ListItem>
                        <asp:ListItem Value="2">Option 2</asp:ListItem>
                        <asp:ListItem Value="3">Option 3</asp:ListItem>
                        <asp:ListItem Value="4">Option 4</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Error -->
                <div class="error">
                    <asp:Label ID="LblError" runat="server"></asp:Label>
                </div>

                <!-- Button -->
                <asp:Button ID="BtnSubmit" 
                    runat="server" 
                    Text="Save & Next" 
                    CssClass="btn"
                    OnClick="Button1_Click" />

            </div>
        </div>

    </form>
</body>
</html>
