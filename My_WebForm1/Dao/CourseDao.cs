using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace My_WebForm1.Dao
{
    public class CourseDao : BaseLMS
    {

        public override DataTable GetAllRows()
        {
            string qry = "select '0' as Id, 'Select your Course' as CourseName  union select Id, CourseName from CourseMaster";
            DataTable dt = GetData(qry);

            return dt;
        }

        public override DataTable GetOneRow(string name)
        {
            throw new NotImplementedException();
        }


        public override int Delete(object model)
        {
            throw new Exception();
            //Course course = (Course)model;
            //string qry = "Delete from coursemaster where CourseName="+course.CourseName ;
            //int rows = PerformInsertUpdateDelete(qry);
            //return rows;
        }


        public override int Insert(object model)
        {
            Course course = (Course)model;

            string qry = @"insert into coursemaster values (@CourseName ,@Description ,@Modules ,@Duration)";
            List<SqlParameter> lt_params = new List<SqlParameter>()
            {
                new SqlParameter("@CourseName", course.CourseName),
                new SqlParameter("@Description", course.Description),
                new SqlParameter("@Modules", course.Modules),
                new SqlParameter("@Duration", course.Duration),
            };

            int RowsEffected = PerformInsertUpdateDelete(qry, lt_params);
            return RowsEffected;
        }

        public override int Update(object model)
        {
            throw new Exception();
            //Course course = (Course)model;
            //string qry = "Update coursemaster set Modules = "+ course.Modules +"  where CourseName=" + course.CourseName;
            //int rows = PerformInsertUpdateDelete(qry);
            //return rows;
        }
    }
}