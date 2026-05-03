using My_WebForm1.Dao;
using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Faculty
{
    public partial class FacultyLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnFacultyLogin_Click(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                //Session["FacultyName"] = TxtFacutlyName.Text;
            //}

                //if ((string)Session["FacultyName"] == "Ram")
                //{
                //    Response.Redirect("ManageCourse.aspx");
                //}
            
            Users user = new Users();
            user.Name = TxtFacutlyName.Text;
            user.Password = TxtFacultyPassword.Text;

            if(string.IsNullOrEmpty(user.Name) || string.IsNullOrEmpty(user.Password))
            {
                LblFacultyLogin.Text = "Please enter both username and password.";
                LblFacultyLogin.ForeColor = System.Drawing.Color.Red;
                return;
            }

            UsersDao usersDao = new UsersDao();
            user = usersDao.CheckUserLogin(user);

            if (user.Id > 0)
            {
                Session["FacultyName"]= user.Name;
                Response.Redirect("ManageCourse.aspx");
            }
            else
            {
                LblFacultyLogin.Text = "Error while Log in";
                LblFacultyLogin.ForeColor = System.Drawing.Color.Red;
                LblFacultyLogin.Visible = true;
            }

        }
    }
}