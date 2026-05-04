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
            // Prevent browser caching - To avoid going back to this page after logout using browser back button
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            // Always check session FIRST
            if (Session["studid"] == null)
            {
                Response.Redirect("StudentLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Display results first...

                // Then, clear test-related sessions so they can't re-run the test logic
                Session["testid"] = null;
                // Keep studid if they need to stay logged in!
            }
        }

        protected void LogOutBtn2_Clk(object sender, EventArgs e)
        {
            Session.Clear();      // Clear all session variables
            Session.Abandon();      // Destroy the session completely
            Response.Redirect("StudentLogin.aspx");   // Redirect to login page
        }

    }
}