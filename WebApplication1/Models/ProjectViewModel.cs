using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class ProjectViewModel
    {
        public int Id { get; set; }

        [Display(Name = "Project Title")]
        public string name { get; set; }

        [Display(Name = "Project Type")]
        public string type { get; set; }
    }
}