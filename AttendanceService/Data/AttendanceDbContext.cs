using Microsoft.EntityFrameworkCore;
using AttendanceService.Models;

namespace AttendanceService.Data
{
    public class AttendanceDbContext : DbContext
    {
        public AttendanceDbContext(DbContextOptions<AttendanceDbContext> options)
            : base(options) { }

        public DbSet<Attendance> Attendances { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Attendance>()
                .HasIndex(a => new { a.StudentId, a.CourseId, a.Date })
                .IsUnique();
        }
    }
}
