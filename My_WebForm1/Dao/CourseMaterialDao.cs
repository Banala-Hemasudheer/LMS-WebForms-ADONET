using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace My_WebForm1.Dao
{
    public class CourseMaterialDao : BaseLMS
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
            CourseMaterial coursematerial = (CourseMaterial)model;
            string Query = @"Insert into coursematerial values (@ModuleName, @Material, @RefPDFPath, @CourseId)";

            List<SqlParameter> Params = new List<SqlParameter>
            {
                new SqlParameter("@ModuleName", coursematerial.ModuleName),
                new SqlParameter("@Material", coursematerial.Material),
                new SqlParameter("@RefPDFPath", coursematerial.RefPDFPath),
                new SqlParameter("@CourseId", coursematerial.CourseId)
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