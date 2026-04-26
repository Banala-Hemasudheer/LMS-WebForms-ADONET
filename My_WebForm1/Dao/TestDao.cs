using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace My_WebForm1.Dao
{
    public class TestDao : BaseLMS
    {

        //Added on Feb 08 2026
        public DataTable GetTestsWithAttempts(int studentId)
        {
            List<SqlParameter> parameters = new List<SqlParameter>
        {
            new SqlParameter("@StudentId", studentId)
        };

            return ExecuteStoredProcedure("GetTestsWithAttempts", parameters);
        }



        public override int Delete(object model)
        {
            throw new NotImplementedException();
        }

        public override DataTable GetAllRows()
        {
            string query = "Select * from testmaster";
            return GetData(query);
        }

        public override DataTable GetOneRow(string TestName)
        {
            string query = "Select * from testmaster where name='"+TestName+"'";
            return GetData(query);
        }

        public override int Insert(object model)
        {
            Test test = (Test)model;
            string Query = @"Insert into TestMaster values (@Name, @Duration, @TotalQuestions, @CourseId)";

            List<SqlParameter> Params = new List<SqlParameter>
            {
                new SqlParameter("@Name", test.Name),
                new SqlParameter("@Duration", test.Duration),
                new SqlParameter("@TotalQuestions", test.TotalQuestions),
                new SqlParameter("@CourseId", test.CourseId)
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