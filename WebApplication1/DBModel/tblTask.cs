//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.DBModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblTask
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblTask()
        {
            this.tblTasks1 = new HashSet<tblTask>();
            this.tblTaskStatus = new HashSet<tblTaskStatu>();
        }
    
        public int ID { get; set; }
        public Nullable<int> sheetID { get; set; }
        public Nullable<int> parentOF { get; set; }
        public Nullable<int> typeID { get; set; }
        public string Title { get; set; }
        public string description { get; set; }
        public Nullable<int> hours { get; set; }
        public Nullable<System.DateTime> creationDate { get; set; }
        public string createdByID { get; set; }
        public Nullable<System.DateTime> updationDate { get; set; }
        public string updatedByID { get; set; }
    
        public virtual tblLookUp tblLookUp { get; set; }
        public virtual tblSheet tblSheet { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblTask> tblTasks1 { get; set; }
        public virtual tblTask tblTask1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblTaskStatu> tblTaskStatus { get; set; }
    }
}