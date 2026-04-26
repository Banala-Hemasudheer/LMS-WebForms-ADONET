using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace My_WebForm1.Dao
{
    public class StudentAttemptDetailsDao : BaseLMS
    {
        public override int Delete(object model)
        {
            StudentAttemptDetails attemptDetails = (StudentAttemptDetails)model;
            string Query = "Delete from StudentAttemptDetails where StudentId="+attemptDetails.StudentId+" and TestQuestionId="+attemptDetails.TestQuestionId;
            
            return PerformInsertUpdateDelete(Query);
        }

        public override DataTable GetAllRows()
        {
            throw new NotImplementedException();
        }

        public override DataTable GetOneRow(string name)
        {
            throw new NotImplementedException();
        }

        public DataTable GetAttemptDetailsByTestIdandStudentId(int TestId, int StudentId)
        {
            string query = "select TQ.Question, SAD.SelectedAns, TQ.CorrectAnswer, TQ.Explanation, SAD.IsCorrect" +
                " from TestQuestions TQ , StudentAttemptDetails SAD where TQ.Id = SAD.TestQuestionId " +
                " and TQ.Testid=" + TestId + " and SAD.StudentId=" + StudentId;

            return GetData(query);
        }

        public override int Insert(object model)
        {
            StudentAttemptDetails attemptDetails = (StudentAttemptDetails)model;

            

            string Query = @"INSERT INTO StudentAttemptDetails (StudentId, TestQuestionId, SelectedAns, IsCorrect) 
                                                        VALUES (@StudentId, @TestQuestionId, @SelectedAns, @IsCorrect)";

            List<SqlParameter> Params = new List<SqlParameter>
            {
                new SqlParameter("@StudentId", attemptDetails.StudentId),
                new SqlParameter("@TestQuestionId", attemptDetails.TestQuestionId),
                new SqlParameter("@SelectedAns", attemptDetails.SelectedAns),
                new SqlParameter("@IsCorrect", attemptDetails.IsCorrect)
            };

            int RowsEffected = base.PerformInsertUpdateDelete(Query, Params);
            return RowsEffected;
        }

        public override int Update(object model)
        {
            throw new NotImplementedException();
        }
    }
}