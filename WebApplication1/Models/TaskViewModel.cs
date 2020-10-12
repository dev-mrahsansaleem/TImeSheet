using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class TaskViewModel
    {
        public int id { get; set; }
        [Display(Name ="Task Title")]
        public string title { get; set; }
        [Display(Name = "Task Type")]
        public int type { get; set; }
        [Display(Name = "Hours of working")]
        public int hours { get; set; }
    }
}