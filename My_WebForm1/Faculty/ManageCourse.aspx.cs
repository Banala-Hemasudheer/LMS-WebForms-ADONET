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
    public partial class ManageCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent browser caching - To avoid going back to this page after logout using browser back button
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            // Always check session FIRST
            if (Session["FacultyName"] == null)
            {
                Response.Redirect("FacultyLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {

            }
        }

        protected void BtnCourseAdd_Click(object sender, EventArgs e)
        {
            Course course = new Course();

            course.CourseName = TxtCourseName.Text;
            course.Description = TxtDescription.Text;
            course.Modules = TxtModules.Text;
            course.Duration = TxtYears.Text;


            CourseDao courseDao = new CourseDao();
            int result = courseDao.Insert(course);

            if (result != 0)
            {
                // Success message
                LblCourseError.ForeColor = System.Drawing.Color.Green;
                LblCourseError.Text = "Course Added Successfully";
                LblCourseError.Visible = true;

                // Clear the form fields
                TxtCourseName.Text = "";
                TxtDescription.Text = "";
                TxtModules.Text = "";
                TxtYears.Text = "";

                // Important: Refresh the SqlDataSource first
                CourseMasterList.DataBind();   // forces SqlDataSource to fetch fresh data
                GridView1.DataBind();       // then refresh GridView
            }
            else
            {
                LblCourseError.ForeColor = System.Drawing.Color.Red;
                LblCourseError.Text = "Error adding course!";
                LblCourseError.Visible = true;
            }
        
        }

        protected void FacLogOut_Clk(object sender, EventArgs e)
        {
            Session.Clear();      // Clear all session variables
            Session.Abandon();      // Destroy the session completely
            Response.Redirect("FacultyLogin.aspx");   // Redirect to login page
        }
    }
}

