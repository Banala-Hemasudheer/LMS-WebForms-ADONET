using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Faculty
{
    public partial class FacultyLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnFacultyLogin_Click(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                Session["FacultyName"] = TxtFacutlyName.Text;
            //}

                if ((string)Session["FacultyName"] == "Ram")
                {
                    Response.Redirect("ManageCourse.aspx");
                }
            
        }
    }
}