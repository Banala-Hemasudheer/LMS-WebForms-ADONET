using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_WebForm1.Model
{
    public class TestSummary
    {
        public int StudentId { get; set; }

        public int TestId { get; set; }

        public DateTime AttemptDate { get; set; }

        public bool Result { get; set; }
    }
}