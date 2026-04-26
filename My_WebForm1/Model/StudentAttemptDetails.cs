using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class StudentAttemptDetails
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int TestQuestionId { get; set; }
        public int SelectedAns { get; set; }
        public bool IsCorrect { get; set; }

    }
}