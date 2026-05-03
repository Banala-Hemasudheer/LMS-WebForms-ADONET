<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="My_WebForm1.Student_.Register" %>

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
            width: 667px;
            text-align: right;
        }
        .auto-style4 {
            width: 667px;
            text-align: right;
            height: 29px;
        }
        .auto-style5 {
            height: 29px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
            text-align: right;
            width: 666px;
        }
        .auto-style9 {
            height: 26px;
            text-align: right;
            width: 666px;
        }
        .auto-style10 {
            width: 666px;
            text-align: right;
        }
        .auto-style11 {
            width: 666px;
        }
        .auto-style12 {
            width: 667px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="text-align: center" colspan="2">Registration Form</td>
                </tr>
                <tr>
                    <td class="auto-style3">Name: </td>
                    <td>
                        <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUsername" ErrorMessage="Name is must"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Password:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPassword" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Re-Password:</td>
                    <td>
                        <asp:TextBox ID="TxtRePassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtRePassword" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        Phone No:&nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPhoneNo" runat="server" MaxLength="10" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtPassword" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">Email:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Gender:</td>
                <td class="auto-style6">
                    <asp:RadioButton ID="RBtnMale" runat="server" GroupName="Gender" Text="Male" Checked="True" />
                    <asp:RadioButton ID="RbtnFemale" runat="server" GroupName="Gender" Text="Fe-male" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10">State:</td>
                <td>
                    <asp:DropDownList ID="DdlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlState_SelectedIndexChanged">
                        <asp:ListItem>Select your State</asp:ListItem>
                        <asp:ListItem>AP</asp:ListItem>
                        <asp:ListItem>TG</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">City</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DdlCity" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Address:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox3" runat="server" Height="82px" TextMode="MultiLine" Width="333px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">DOB:</td>
                <td>
                    <asp:LinkButton ID="LkbtnDOB" runat="server" OnClick="LkbtnDOB_Click">Choose Date</asp:LinkButton>
                    <asp:Calendar ID="CalDOB" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" OnSelectionChanged="CalDOB_SelectionChanged" Visible="False" Width="330px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Label ID="LblDOB" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Upload Your Photo:</td>
                <td class="auto-style7">
                    <asp:FileUpload ID="FileUploadSelection" runat="server" />
                    <%--<asp:Image ID="ImageUploaded" runat="server" Height="45px" Visible="False" Width="60px" />--%><%--Instead of image I'll show uploaded file name--%>
                </td>
            <%--</tr>
            <tr>
                <td class="auto-style11" style="text-align: right">&nbsp;</td>
                <td>

                    <asp:Button ID="BtnUpload" runat="server" OnClick="BtnUpload_Click" Text="Upload" />
                    <asp:Label ID="LblUploaded" runat="server" ForeColor="#3333CC" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style12" style="text-align: right">
                        Select the Course</td>
                <td>
                    <asp:DropDownList ID="DdlCourse" runat="server">
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td class="auto-style12">
                        <asp:Label ID="LabelError" runat="server" Font-Bold="True" ForeColor="#FF3300" style="text-align: right"></asp:Label>
                    </td>
                <td>
                        <asp:Button ID="Button1" runat="server" BorderColor="#33CCCC" Font-Bold="True" ForeColor="Black" OnClick="Button1_Click" Text="SubMit" style="text-align: right; margin-left: 0px" />
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="My_WebForm1.Student_.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <style>

        body {
            margin: 0;
            font-family: "Segoe UI", Arial;
            background-color: #f4f6f9;
        }

        .container {
            width: 60%;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .title {
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            color: #2a5298;
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 25px;
        }

        .section h3 {
            color: #1e3c72;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #2a5298;
            outline: none;
        }

        .row {
            display: flex;
            gap: 15px;
        }

        .row .form-group {
            flex: 1;
        }

        .btn {
            background-color: #2a5298;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1e3c72;
        }

        .error {
            color: red;
            font-size: 13px;
        }

        .success {
            color: green;
            font-size: 13px;
        }

        .radio-group {
            display: inline-flex;
            gap: 10px;          /* space between options */
            align-items: center;
        }

    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="card">

                <div class="title">Student Registration</div>

                <!-- Basic Info -->
                <div class="section">
                    <h3>Basic Information</h3>

                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="TxtUsername" CssClass="error"
                            ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="TxtRePassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Phone Number</label>
                        <asp:TextBox ID="TxtPhoneNo" runat="server" MaxLength="10"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
                    </div>
                </div>

                <!-- Personal Info -->
                <div class="section">
                    <h3>Personal Details</h3>

                    <div class="form-group">
                        <div class="radio-group">
                             <label>Gender</label>
                            <asp:RadioButton ID="RBtnMale" runat="server" GroupName="Gender" Text="Male" Checked="True" />
                            <asp:RadioButton ID="RbtnFemale" runat="server" GroupName="Gender" Text="Female" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label>State</label>
                            <asp:DropDownList ID="DdlState" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="DdlState_SelectedIndexChanged">
                                <asp:ListItem>Select your State</asp:ListItem>
                                <asp:ListItem>AP</asp:ListItem>
                                <asp:ListItem>TG</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>City</label>
                            <asp:DropDownList ID="DdlCity" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <!-- Additional -->
                <div class="section">
                    <h3>Additional Details</h3>

                    <div class="form-group">
                        <label>Date of Birth</label>
                        <asp:LinkButton ID="LkbtnDOB" runat="server" OnClick="LkbtnDOB_Click">Choose Date</asp:LinkButton>
                        <br /><br />
                        <asp:Calendar ID="CalDOB" runat="server" Visible="False"
                            OnSelectionChanged="CalDOB_SelectionChanged"></asp:Calendar>
                        <asp:Label ID="LblDOB" runat="server"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>Upload Photo</label>
                        <asp:FileUpload ID="FileUploadSelection" runat="server" />
                        <br />
                        <asp:Button ID="BtnUpload" runat="server" Text="Upload" CssClass="btn"
                            OnClick="BtnUpload_Click" />
                        <asp:Label ID="LblUploaded" runat="server" CssClass="success"></asp:Label>
                    </div>

                    <div class="form-group">
                        <label>Select Course</label>
                        <asp:DropDownList ID="DdlCourse" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <!-- Submit -->
                <div class="form-group">
                    <asp:Label ID="LabelError" runat="server" CssClass="error"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server"
                        Text="Register"
                        CssClass="btn"
                        OnClick="Button1_Click" />
                </div>

            </div>
        </div>

    </form>
</body>
</html>
