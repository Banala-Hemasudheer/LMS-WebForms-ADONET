using My_WebForm1.Model;
using My_WebForm1.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace My_WebForm1.Dao
{
    public class UsersDao : BaseLMS
    {
        public Users CheckUserLogin(Users user)    // Faculty login method that checks credentials against the database
        {
            string query = "select * from Users where Name='" + user.Name + "' and Password='" + user.Password + "'";
            DataTable dt = GetData(query);

            if (dt.Rows.Count > 0)
            {
                user.Id = (int)dt.Rows[0]["ID"];
                user.EnPassword = dt.Rows[0]["EnPassword"].ToString();
            }
            else
            {
                user.Id = 0; // If EnPassword is null, reset Id to 0 to indicate failure
                return user;
            }

                bool Authenticated = PasswordHelper.VerifyPassword(user.Password, user.EnPassword);  // Verify the entered password against the stored hash
            if (!Authenticated)
            {
                user.Id = 0; // If authentication fails, reset Id to 0 to indicate failure
            }

            return user;
        }

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
            throw new NotImplementedException();
        }

        public override int Update(object model)
        {
            throw new NotImplementedException();
        }
    }
}