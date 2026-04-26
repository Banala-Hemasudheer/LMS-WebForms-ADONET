<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttemptTest.aspx.cs" Inherits="My_WebForm1.Student_.AttemptTest" %>

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
</html>
