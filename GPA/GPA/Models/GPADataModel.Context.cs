﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TestDBEntities : DbContext
    {
        public TestDBEntities()
            : base("name=TestDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Grade> Grades { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Student_GPA> Student_GPA { get; set; }
        public virtual DbSet<Task> Tasks { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
