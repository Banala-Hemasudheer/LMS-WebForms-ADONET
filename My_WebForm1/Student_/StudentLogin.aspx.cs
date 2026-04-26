using My_WebForm1.Dao;
using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Student_
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnStudLogin_Click(object sender, EventArgs e)
        {
            Student student = new Student();

            student.Name = TxtStudName.Text;
            student.Password = TxtStudPassword.Text;

            StudentDao studentDao = new StudentDao();
            student = studentDao.CheckUserLogin(student);

            if (student.Id > 0)
            {
                // 1. First Way- Response.Redirect -> Data will be posted to only next page, From there after data will not be posted.
                //Response.Redirect("StudentHome.aspx?studname=" + student.Name + "&studid=" + student.Id);

                //2. Second Way-
                Session["studname"] = student.Name;
                Session["studid"] = student.Id;

                Session["courseid"] = student.FKCourseId;       //Will be used to display details in student Home page

                Response.Redirect("StudentHome.aspx");
            }
            else {
                LblStudLogin.Text = "Error while Log in";
                LblStudLogin.ForeColor = System.Drawing.Color.Red;
            }


            //if (StudName == "Ram" && Password == "123")
            //{
            //    LblStudLogin.Text = "Logged in Succesfully";
            //    LblStudLogin.ForeColor = System.Drawing.Color.Green;
            //    LblStudLogin.Visible = true;
            //}
            //else
            //{
            //    LblStudLogin.Text = "Log in Failed";
            //    LblStudLogin.ForeColor = System.Drawing.Color.Red;
            //    LblStudLogin.Visible = true;
            //}

        }
    }
}

