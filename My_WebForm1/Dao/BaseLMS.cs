using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace My_WebForm1.Dao
{
    public abstract class BaseLMS : IDao
    {

        protected string Connection { get; set; }
        protected SqlConnection Con {  get; set; }
        protected SqlCommand Cmd { get; set; }
        protected SqlDataAdapter Adap {  get; set; }

        public BaseLMS() {
            Connection = "server=localhost; initial catalog=LMS; integrated security=true";
            Con = new SqlConnection(Connection);  
            Cmd = Con.CreateCommand();
        }


        //Added on Feb 08 2026
        protected DataTable ExecuteStoredProcedure( string spName, List<SqlParameter> parameters)
        {
            try
            {
                DataTable dt = new DataTable();

                // 1. Clear previous parameters to avoid accumulation errors
                Cmd.Parameters.Clear();

                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.CommandText = spName;

                if (parameters != null && parameters.Count > 0)
                        Cmd.Parameters.AddRange(parameters.ToArray());

                Adap = new SqlDataAdapter(Cmd);
                Adap.Fill(dt);

                return dt;
            }
            catch (Exception e)
            {
                Console.WriteLine("Error executing SP: " + e.Message);
                return null;
            }
        }




        protected int PerformInsertUpdateDelete(string query)
        {
            string Query_str = query.Trim();
            try { 
                Con.Open();
                Cmd.CommandType = System.Data.CommandType.Text;
                Cmd.CommandText = Query_str;

                Cmd.Parameters.Clear();
                int Rows = Cmd.ExecuteNonQuery();
                return Rows;
            }
            catch(Exception e) {
                Console.WriteLine("Error Executing the query: "+ e.Message);
                return 0;
            }
            finally { 
                Con.Close();
            }
        }


        protected int PerformInsertUpdateDelete(string query, List<SqlParameter> Params)
        {
            string Query_str = query.Trim();
            try
            {
                Con.Open();
                Cmd.CommandType = System.Data.CommandType.Text;
                Cmd.CommandText = Query_str;

                Cmd.Parameters.Clear();     //Clearing parameters before
                Cmd.Parameters.AddRange(Params.ToArray()); //Passing exact params list converting to Array
                
                int Rows = Cmd.ExecuteNonQuery();
                return Rows;
            }
            catch (Exception e)
            {
                Console.WriteLine("Error Executing the query: " + e.Message);
                return 0;
            }
            finally
            {
                Con.Close();
            }
        }






        protected DataTable GetData(string query)
        {
            try {
                DataTable dt = new DataTable();
                Adap = new SqlDataAdapter(query, Con);
                Adap.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                Console.WriteLine("Error Executing the query: " + e.Message); 
                return null;
            }
        }

        public abstract DataTable GetAllRows();
        public abstract DataTable GetOneRow(string name);

        public abstract int Insert(object model);
        public abstract int Update(object model);
        public abstract int Delete(object model);
    }
}




