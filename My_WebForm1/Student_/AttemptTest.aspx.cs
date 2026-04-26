using My_WebForm1.Dao;
using My_WebForm1.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Student_
{
    public partial class AttemptTest : System.Web.UI.Page
    {
        // Declared static - when page PostBack or Reloads - The values will not be affected -Alternate way(Keeping Hidden)
        static DataTable DtQuestions;
        static int CurrentQuestion = 0;
        static bool IsLastQuestion;
        //static Hashtable QuestionAnswer = new Hashtable();
        static List<StudentAttemptDetails> studentAttemptDetails = new List<StudentAttemptDetails>();
        int CountCorrectAnswers = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // STEP 1: Always prevent caching so the "Back" button forces a server request
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            // STEP 2: Security Check - if the test is over, kick them out immediately
            if (Session["testid"] == null)
            {
                Response.Redirect("StudentHome.aspx");
                return; // Stop execution right here
            }



            if (!IsPostBack) {

                // 1st way - will fail =>trying to navigate from more than one page.
                //string name = Request.QueryString["name"];

                // 2nd way
                string name = (string)Session["studname"];
                LblAttemptTest.Text = "Welcome " + name + " for attempting Test with Session[testid]= "+ Session["testid"];

                int TestId = Convert.ToInt32(Session["testid"]);

                LoadQuestionsUsingTestId();
                DisplayQuestion();
            }
        }

        private void LoadQuestionsUsingTestId()
        {
            TestQuestionsDao testQuestionsDao = new TestQuestionsDao();
            DtQuestions = testQuestionsDao.GetTestQuestionsByCourseId(Convert.ToInt32(Session["testid"]));
        }

        private void DisplayQuestion()
        {
            DdlChoosenOption.SelectedIndex = 0;

            if (DtQuestions !=null && DtQuestions.Rows.Count > 0)
            {
                LblQuestionId.Text = DtQuestions.Rows[CurrentQuestion]["Id"].ToString();

                LblQuestion.Text = DtQuestions.Rows[CurrentQuestion]["Question"].ToString();
                LblOption1.Text = DtQuestions.Rows[CurrentQuestion]["Answer1"].ToString();
                LblOption2.Text = DtQuestions.Rows[CurrentQuestion]["Answer2"].ToString();
                LblOption3.Text = DtQuestions.Rows[CurrentQuestion]["Answer3"].ToString();
                LblOption4.Text = DtQuestions.Rows[CurrentQuestion]["Answer4"].ToString();
            }

            if (CurrentQuestion == DtQuestions.Rows.Count-1)  // CurrentQuestion, DtQuestions - Start from Index '0'
            {
                IsLastQuestion = true;
                BtnSubmit.Text = "Finish";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

                int QuestionId = Convert.ToInt32(DtQuestions.Rows[CurrentQuestion]["Id"].ToString());
                //QuestionAnswer.Add(QuestionId, Convert.ToInt32(DdlChoosenOption.SelectedValue));

                StudentAttemptDetails attemptDetails = new StudentAttemptDetails();
                attemptDetails.TestQuestionId = QuestionId;
                attemptDetails.StudentId = Convert.ToInt32(Session["studid"]);
                attemptDetails.SelectedAns = Convert.ToInt32(DdlChoosenOption.SelectedValue);
               
                if(Convert.ToInt32(DdlChoosenOption.SelectedValue) == Convert.ToInt32(DtQuestions.Rows[CurrentQuestion]["CorrectAnswer"].ToString()))
                {
                    attemptDetails.IsCorrect = true;
                    CountCorrectAnswers++;
                }
                else attemptDetails.IsCorrect = false;

                studentAttemptDetails.Add(attemptDetails);

            if (!IsLastQuestion)
            {
                // To Display Next Question
                CurrentQuestion++;
                DisplayQuestion();
            }
            else
            {
                //1. Code for saving the data
                StudentAttemptDetailsDao studentAttemptDetailsDao = new StudentAttemptDetailsDao();

                //2. Read Each Attempted Question from the List & Insert them into table
                foreach(StudentAttemptDetails Attemptedquestion in studentAttemptDetails)
                {
                    //To Delete If there's an already Existing Student Attempt
                    studentAttemptDetailsDao.Delete(Attemptedquestion);
               
                    studentAttemptDetailsDao.Insert(Attemptedquestion);
                }



                //3. calculate the result and store into student attempt summary table  
                TestSummary testsummary = new TestSummary();
                testsummary.StudentId = Convert.ToInt32(Session["studid"]);
                testsummary.TestId = Convert.ToInt32(Session["testid"]);
                testsummary.AttemptDate = DateTime.Now;

                if (CountCorrectAnswers >= (DtQuestions.Rows.Count / 2))
                {
                    //means student is qualified as he has secured 50% or more
                    testsummary.Result = true;
                }
                else
                {
                    testsummary.Result = false;
                }

                TestSummaryDao studentSummaryDao = new TestSummaryDao();
                studentSummaryDao.Insert(testsummary);


                Response.Redirect("StudentTestSummary.aspx");
            }
           
        }
    }
}
