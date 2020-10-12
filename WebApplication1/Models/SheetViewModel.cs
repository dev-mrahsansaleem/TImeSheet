using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class SheetViewModel
    {
        public int id { get; set; }
        [Display(Name = "Week No")]
        public string WeekNo { get; set; }
        [Display(Name = "Creation Date")]
        public DateTime CreatedOn { get; set; }
    }
}