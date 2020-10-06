using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class ProjectViewModel
    {

        [Display(Name="Project Name")]
        public string name { get; set; }

        public int typeId { get; set; }
        public string type { get; set; }
        public string description { get; set; }
    }
}