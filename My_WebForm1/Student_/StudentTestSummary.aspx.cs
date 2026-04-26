using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Student_
{
    public partial class StudentTestSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Display results first...

                // Then, clear test-related sessions so they can't re-run the test logic
                Session["testid"] = null;
                // Keep studid if they need to stay logged in!
            }
        }
    }
}