using IAGWeb.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace IAGWeb.DAL
{
    public class StudentInformerDbContext : DbContext
    {
        public StudentInformerDbContext() : base ("DefaultConnection")
        {

        }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<ProjectHistory> ProjectHistories { get; set; }
    }
}