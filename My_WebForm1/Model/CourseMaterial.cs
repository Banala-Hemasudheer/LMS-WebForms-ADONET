using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class CourseMaterial
    {
        public int Id { get; set; }
        public string ModuleName { get; set; }
        public string Material {  get; set; }
        public string RefPDFPath { get; set; }
        public int CourseId { get; set; }

    }
}