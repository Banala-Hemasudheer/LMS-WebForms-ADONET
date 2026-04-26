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
    public partial class ManageQuestionBank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DdlTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridView1.DataBind();      - Instead set AutoPostBack="true" in Corresponding DropDownList - It re-executes GridView's - SQL Query.
        }

        protected void BtnAddTest_Click(object sender, EventArgs e)
        {
            TestQuestions testQuestions = new TestQuestions();

            testQuestions.Question = TxtQuestion.Text;
            testQuestions.Answer1 = TxtAns1.Text;
            testQuestions.Answer2 = TxtAns2.Text;
            testQuestions.Answer3 = TxtAns3.Text;
            testQuestions.Answer4 = TxtAns4.Text;
            testQuestions.CorrectAnswer = Int32.Parse(DdlCorrectAns.SelectedValue);

            testQuestions.Explanation = TxtExplain.Text;
            testQuestions.TestId = Convert.ToInt32(DdlTest.SelectedValue);

            TestQuestionsDao testQuestionsDao = new TestQuestionsDao();
            int Result = testQuestionsDao.Insert(testQuestions);

            if (Result == 0)
            {
                LblError.Text = "Insertion Failed";
                LblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                LblError.Text = "Success";
                LblError.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}
