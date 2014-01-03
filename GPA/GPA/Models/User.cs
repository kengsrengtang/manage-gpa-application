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
    
    public partial class User
    {
        public User()
        {
            this.Feedbacks = new HashSet<Feedback>();
            this.Student_GPA = new HashSet<Student_GPA>();
            this.UserRoles = new HashSet<UserRole>();
        }
    
        public int User_ID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string VerificationCode { get; set; }
    
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<Student_GPA> Student_GPA { get; set; }
        public virtual UserDetail UserDetail { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
