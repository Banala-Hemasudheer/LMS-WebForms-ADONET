using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static System.Net.Mime.MediaTypeNames;

namespace My_WebForm1.Dao
{
    public class TestQuestionsDao : BaseLMS
    {
        public override int Delete(object model)
        {
            throw new NotImplementedException();
        }

        public override DataTable GetAllRows()
        {
            throw new NotImplementedException();
        }

        public override DataTable GetOneRow(string name)
        {
            throw new NotImplementedException();
        }

        public DataTable GetTestQuestionsByCourseId(int TestId)
        {
            string query = "Select * from testquestions where testid=" + TestId;
            return GetData(query);
        }

        public override int Insert(object model)
        {
            TestQuestions testquestions = (TestQuestions)model;
            string Query = @"Insert into testquestions values (@Question, @Answer1, @Answer2, @Answer3, @Answer4, @CorrectAnswer, @Explanation, @TestId)";

            List<SqlParameter> Params = new List<SqlParameter>
            {
                new SqlParameter("@Question", testquestions.Question),
                new SqlParameter("@Answer1", testquestions.Answer1),
                new SqlParameter("@Answer2", testquestions.Answer2),
                new SqlParameter("@Answer3", testquestions.Answer3),
                new SqlParameter("@Answer4", testquestions.Answer4),
                new SqlParameter("@CorrectAnswer", testquestions.CorrectAnswer),
                new SqlParameter("@Explanation", testquestions.Explanation),
                new SqlParameter("@TestId", testquestions.TestId)
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