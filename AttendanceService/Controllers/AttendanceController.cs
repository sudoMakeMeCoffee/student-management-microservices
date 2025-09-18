using Microsoft.AspNetCore.Mvc;
using AttendanceService.Models;
using AttendanceService.Repositories;

namespace AttendanceService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AttendanceController : ControllerBase
    {
        private readonly AttendanceRepository _repo;

        public AttendanceController(AttendanceRepository repo)
        {
            _repo = repo;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll() =>
            Ok(await _repo.GetAllAsync());

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var record = await _repo.GetByIdAsync(id);
            return record == null ? NotFound() : Ok(record);
        }

        [HttpPost]
        public async Task<IActionResult> Add([FromBody] Attendance attendance)
        {
            await _repo.AddAsync(attendance);
            return CreatedAtAction(nameof(GetById), new { id = attendance.Id }, attendance);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Attendance attendance)
        {
            if (id != attendance.Id) return BadRequest();
            await _repo.UpdateAsync(attendance);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _repo.DeleteAsync(id);
            return NoContent();
        }
    }
}
