using My_WebForm1.Dao;
using My_WebForm1.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_WebForm1.Faculty
{
    public partial class ManageMaterial : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnUploadFile_Click(object sender, EventArgs e)
        {
            string folderpath = Server.MapPath("~/Up_load");
            if (!Directory.Exists(folderpath))
            {
                Directory.CreateDirectory(folderpath);
            }

            HddnFldOnFileName.Value = FileUploadMaterial.FileName;                 // Usage of Hidden Field - To Preseve File Name during PostBack's

            string Filepath = Path.Combine(folderpath, HddnFldOnFileName.Value);   // Filepath is Formed 
            FileUploadMaterial.SaveAs(Filepath);                                       // Saves the Uploaded File to Specified Path

            LblUpload.Text = "File " + FileUploadMaterial.FileName + " Uploaded Successfully";
            LblUpload.ForeColor = System.Drawing.Color.Green;
        }

        protected void BtnAddCourseMaterial_Click(object sender, EventArgs e)
        {
            CourseMaterial courseMaterial = new CourseMaterial();

            courseMaterial.CourseId = Convert.ToInt32(DdlCourseList.SelectedIndex);
            courseMaterial.ModuleName = TxtModuleName.Text;

            string folderpath = Server.MapPath("~/Up_load");

            string PDFName = HddnFldOnFileName.Value;   // Usage of Hidden Field - To Preseve File Name during PostBack's

            courseMaterial.Material = PDFName;
            courseMaterial.RefPDFPath = Path.Combine(folderpath, PDFName);  // Adding PDFName with Folder Path

            CourseMaterialDao courseMaterialDao = new CourseMaterialDao();
            courseMaterialDao.Insert(courseMaterial);
        }

        protected void DdlCourseList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // On changing Course - selecting Relevant Materials.

            //GVCourseMaterial.DataBind();          - As AutoPostBack="true" in DdlCourseList - It re-executes GV - SQL Query.
        }
    }
}



