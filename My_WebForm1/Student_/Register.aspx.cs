using My_WebForm1.Dao;
using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Student_
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                
                // DataBinding Manually - on PageLoad for 
                Course course = new Course();
                CourseDao courseDao = new CourseDao();
                DataTable CourseData = courseDao.GetAllRows();

                DdlCourse.DataSource = CourseData;
                DdlCourse.DataTextField = "CourseName";
                DdlCourse.DataValueField = "Id";                                     //CourseData.Rows[0].ToString();    // Another way selecting Id - first column 
                DdlCourse.DataBind();                           //Binding Data

                DdlCourse.SelectedIndex = 0;                    //Showing the Defaul value i.e - "Select your course"
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DdlCourse.SelectedIndex == 0)
            {
                LabelError.Text = "Please select Course";
            }

            Student student = new Student();

                //Inserting student details into Database
            student.Name = TxtUsername.Text; //Request.QueryString["username"];
            student.Password = TxtPassword.Text;
            student.Mail = TextBox2.Text;
            student.Phone = Convert.ToInt32(TxtPhoneNo.Text);
            student.Gender = RBtnMale.Checked;
            student.State = DdlState.Text;
            student.City = DdlCity.Text;
            student.Address = TextBox3.Text;
            student.DOB = CalDOB.SelectedDate.ToString();
            student.FKCourseId = int.Parse(DdlCourse.SelectedValue);

            StudentDao studentDao = new StudentDao();
            int result = studentDao.Insert(student);

            if (result == 0) {
                Console.WriteLine("Unable to insert record");
            }
            //else {
            //    Response.Redirect("Home.aspx?user=admin");      //Redirect to home page if inserted 
            //}


            //if ((TxtUsername.Text == "Ram") && (TxtPassword.Text == "123"))
            //{
            //    //Response on click
            //    Response.Redirect("Home.aspx?user=Ram");
            //}
            //else if ((TxtUsername.Text == "admin") && (TxtPassword.Text == "123"))
            //{
            //    Response.Redirect("Home.aspx?user=admin");
            //}
            //else
            //{
            //    LabelError.Text = "Invalid User name and password";
            //}


        }

        protected void DdlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DdlState.SelectedIndex = 0;

            }

            if (DdlState.SelectedIndex > 0)
            {
                DdlCity.Items.Clear();
                ListItem selectItem = new ListItem("Select a City", "Select a City");
                DdlCity.Items.Add(selectItem);


                if (DdlState.SelectedIndex == 1)
                {
                    DdlCity.Items.Add(new ListItem("Vizag", "VSKP"));
                    DdlCity.Items.Add(new ListItem("Srikakulam", "AMDlvlsa"));
                }
                else if (DdlState.SelectedIndex == 2)
                {
                    DdlCity.Items.Add(new ListItem("Hyderabad", "hyd"));
                    DdlCity.Items.Add(new ListItem("Warangel", "wgl"));
                }

            }
        }

        protected void LkbtnDOB_Click(object sender, EventArgs e)
        {
            CalDOB.Visible = true;
        }

        protected void CalDOB_SelectionChanged(object sender, EventArgs e)
        {
            CalDOB.Visible = false;
            LblDOB.Text = CalDOB.SelectedDate.ToString();
            LblDOB.Visible = true;

        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            string folderpath = Server.MapPath("~/Up_load");

            if (!Directory.Exists(folderpath))
            {
                Directory.CreateDirectory(folderpath);
            }

            string path = Path.Combine(folderpath, FileUploadSelection.FileName);

            FileUploadSelection.SaveAs(path);

            //ImageUploaded.ImageUrl = "~/Up_load/"+FileUploadSelection.FileName;
            //ImageUploaded.Visible = true;

            // Showing File name of the uploaded image
            LblUploaded.Text = FileUploadSelection.FileName;
            LblUploaded.Visible = true;

        }
    }
}




