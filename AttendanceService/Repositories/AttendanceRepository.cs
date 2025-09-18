using AttendanceService.Models;
using AttendanceService.Data;
using Microsoft.EntityFrameworkCore;

namespace AttendanceService.Repositories
{
    public class AttendanceRepository
    {
        private readonly AttendanceDbContext _context;

        public AttendanceRepository(AttendanceDbContext context)
        {
            _context = context;
        }

        public async Task<List<Attendance>> GetAllAsync() =>
            await _context.Attendances.ToListAsync();

        public async Task<Attendance?> GetByIdAsync(int id) =>
            await _context.Attendances.FindAsync(id);

        public async Task AddAsync(Attendance attendance)
        {
            _context.Attendances.Add(attendance);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(Attendance attendance)
        {
            _context.Attendances.Update(attendance);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var entity = await _context.Attendances.FindAsync(id);
            if (entity != null)
            {
                _context.Attendances.Remove(entity);
                await _context.SaveChangesAsync();
            }
        }
    }
}
