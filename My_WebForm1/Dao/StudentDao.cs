using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace My_WebForm1.Dao
{
    public class StudentDao : BaseLMS
    {
        public override int Insert(object model)
        {
            Student student = (Student)model;

            string qry = @"insert into studentMaster values (@Name, @Password, @Phone, @Mail, @Gender, @State, @City, @Address, @DOB, @FKCourseId)";
            List<SqlParameter> lt_params = new List<SqlParameter>()
            {
                new SqlParameter("@Name", student.Name),
                new SqlParameter("@Password", student.Password),
                new SqlParameter("@Mail", student.Mail),
                new SqlParameter("@Phone", student.Phone),
                new SqlParameter("@Gender", student.Gender),
                new SqlParameter("@State", student.State),
                new SqlParameter("@City", student.City),
                new SqlParameter("@Address", student.Address),
                new SqlParameter("@DOB", student.DOB),
                new SqlParameter("@FKCourseId", student.FKCourseId)
            };
            

            int RowsEffected = PerformInsertUpdateDelete(qry, lt_params);
            return RowsEffected;
        }

        public override int Delete(object model)
        {
            Student student = (Student)model;
            string qry = "Delete from studentMaster where name=" + student.Name;

            int RowsEffected = PerformInsertUpdateDelete(qry);
            return RowsEffected;
        }

        public override int Update(object model)
        {
            Student student = (Student)model;
            string qry = "Update studentMaster set Phone=0 where ID='" + student.Name +"'";

            int RowsEffected = PerformInsertUpdateDelete(qry);
            return RowsEffected;
        }

        public override DataTable GetAllRows()
        {
            string query = "select * from studentMaster";
            DataTable dt = GetData(query);
            return dt;
        }

        public override DataTable GetOneRow(string name)
        {
            string query = "select * from studentMaster where Name ='" + name + "'";
            DataTable dt = GetData(query);
            return dt;
        }

        public Student CheckUserLogin(Student student)
        {
            string query = "select * from studentMaster where Name='" + student.Name + "' and Password='" + student.Password + "'";
            DataTable dt = GetData(query);

            if (dt.Rows.Count > 0) 
            {
                student.Id = (int)dt.Rows[0]["ID"];
                student.FKCourseId = (int)dt.Rows[0]["FKCourseID"];
            }

            return student;
        }

    }
}
