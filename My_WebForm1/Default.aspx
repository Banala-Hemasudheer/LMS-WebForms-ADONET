<%@ Page Title="" Language="C#" MasterPageFile="~/LMS.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="My_WebForm1.Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>--%>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align:center; padding:20px;">

        <h2>Learning Management System (LMS)</h2>

        <p>
            This project is a fully functional web-based Learning Management System developed using 
            <b>ASP.NET Web Forms, C#, ADO.NET, and SQL Server</b>.
        </p>

        <p>
            It is designed to support both <b>students</b> and <b>faculty</b> through a role-based system, 
            enabling seamless course management, content delivery, and performance tracking.
        </p>

    </div>

    <hr style="margin:30px 0;" />

    <div style="padding:10px 40px;">

        <h3>🔹 Key Highlights</h3>

        <p>✔ Implemented secure login authentication for Students and Faculty</p>
        <p>✔ Designed and managed relational database using SQL Server</p>
        <p>✔ Built dynamic pages using ADO.NET for real-time data operations</p>
        <p>✔ Developed MCQ-based test system with result evaluation</p>
        <p>✔ Created structured modules for course and material management</p>

        <h3 style="margin-top:25px;">🔹 Features</h3>

        <p><b>Student Module:</b> Course access, material downloads, online tests, performance tracking</p>
        <p><b>Faculty Module:</b> Course creation, content upload, test management, student monitoring</p>

        <h3 style="margin-top:25px;">🔹 Purpose of the Project</h3>

        <p>
            This project demonstrates my ability to build end-to-end web applications using the 
            ASP.NET framework, implement database connectivity, and design structured, scalable modules.
        </p>

        <p>
            The focus of this project is on <b>functionality, clean architecture, and backend logic</b>, 
            with UI enhancements added progressively.
        </p>

    </div>

</asp:Content>
