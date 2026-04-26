using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class Course
    {
        public int Id { get; set; }
        public string CourseName { get; set; }
        public string Description { get; set; } = string.Empty;
        public string Modules { get; set; } = string.Empty;
        public string Duration {  get; set; }

    }
}