using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace My_WebForm1.Dao
{
    public class TestSummaryDao : BaseLMS
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

        public override int Insert(object model)
        {
            TestSummary testsummary = (TestSummary)model;
            string Query = @"Insert into TestSummary values (@StudentId, @TestId, @AttemptDate, @Result)";

            List<SqlParameter> Params = new List<SqlParameter>
            {
                new SqlParameter("@StudentId", testsummary.StudentId),
                new SqlParameter("@TestId", testsummary.TestId),
                new SqlParameter("@AttemptDate", testsummary.AttemptDate),
                new SqlParameter("@Result", testsummary.Result)
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