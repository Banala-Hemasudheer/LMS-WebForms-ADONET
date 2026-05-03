using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public int Phone { get; set; }
        public string Mail {  get; set; }   
        public bool Gender { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string DOB { get; set; }

        public int FKCourseId { get; set; }

        public string EnPassword { get; set; }
    }
}