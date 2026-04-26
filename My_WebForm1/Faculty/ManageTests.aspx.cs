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
    public partial class ManageTests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnTestAdd_Click(object sender, EventArgs e)
        {
            Test test = new Test();

            test.Name = TxtTestName.Text;
            test.CourseId = Convert.ToInt32(DdlCourseList.Text);           // Drop down list
            test.Duration = Convert.ToInt32(TxtMins.Text);                 // Text Box of type Number
            test.TotalQuestions = Convert.ToInt32(TxtNoOfQuestions.Text);

            TestDao testDao = new TestDao();

            int Result = testDao.Insert(test);
            if (!(Result > 0))
            {
                LblTestError.Text = "Insertion Failed";
                LblTestError.Visible = true;
                LblTestError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                LblTestError.Text = "Succesfully Inserted";
                LblTestError.Visible = true;
                LblTestError.ForeColor= System.Drawing.Color.Green;

                GridView1.DataBind();       // To Show the Updated Grid
            }
        }

       
    }
}