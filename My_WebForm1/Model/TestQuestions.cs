using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class TestQuestions
    {
    public int Id  {get; set;}
    
    public string Question {get; set;}

        public string Answer1 { get; set; }
        public string Answer2 { get; set; }
        public string Answer3 { get; set; }
        public string Answer4 { get; set; }

    public int CorrectAnswer { get; set; }

    public string Explanation { get; set; }

    public int TestId { get; set; }
    }
}