//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GPA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Course
    {
        public Course()
        {
            this.Student_GPA = new HashSet<Student_GPA>();
        }
    
        public int Id { get; set; }
        public string SubCode { get; set; }
        public string Level { get; set; }
        public string CourseName { get; set; }
        public string Credit { get; set; }
    
        public virtual ICollection<Student_GPA> Student_GPA { get; set; }
    }
}