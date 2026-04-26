using My_WebForm1.Dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Student_
{
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //if (Request.QueryString["studname"] != null)
                //{
                    // 1st way - query string
                    //string name = Request.QueryString["studname"];
                    //string Id = Request.QueryString["studid"];

                if ((int)Session["studid"] > 0)
                 {
                    // 2nd way - using session
                    string name = (string)Session["studname"];
                    int Id = (int)Session["studid"];
                    LblStudHome.Text = "Welcome " + name + " with Id-" + Id;

                    // Calling Stored Procedure to update Grid
                    TestsWithAttempts(Id);
                }
                else
                {
                    LblStudHome.Text = "Welcome ";
                }
            }
          

        }

        protected void LBtnAttemptTest_Click(object sender, EventArgs e)
        {
            // Session's - studid, studname, courseid were already passed on to StudentHome.aspx

            Session["testid"] = DdlTestId.SelectedValue;
            // this testid - passed to AttemptTest.aspx

            Response.Redirect("AttemptTest.aspx");
        }


        protected void TestsWithAttempts(int StudId) {

           TestDao testDao = new TestDao();
            DataTable dt = testDao.GetTestsWithAttempts(StudId);

            GridViewTWA.DataSource = dt;
            GridViewTWA.DataBind();
        }


    }
}


