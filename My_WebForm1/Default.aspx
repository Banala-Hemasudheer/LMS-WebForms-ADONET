<%@ Page Title="" Language="C#" MasterPageFile="~/LMS.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="My_WebForm1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 {
            color: #2c3e50;
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 30px;
        }

        p {
            color: #555;
            font-size: 16px;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Welcome to the Home Page</h2>
    <p style="text-align: center">This text will now show up inside the table in your master page.</p>
</asp:Content>


