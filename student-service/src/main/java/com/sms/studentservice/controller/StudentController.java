package com.sms.studentservice.controller;

import com.sms.studentservice.dto.StudentRequestDTO;
import com.sms.studentservice.dto.StudentResponseDTO;
import com.sms.studentservice.service.StudentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/students")
@RequiredArgsConstructor
public class StudentController {


    private final StudentService studentService;

    @PostMapping
    public ResponseEntity<StudentResponseDTO> createStudent(@Valid @RequestBody StudentRequestDTO studentRequestDTO) {
        StudentResponseDTO createdStudent = studentService.createStudent(studentRequestDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(createdStudent);
    }

    @GetMapping
    public ResponseEntity<List<StudentResponseDTO>> getAllStudents() {
        List<StudentResponseDTO> allStudents = studentService.getAllStudents();

        return ResponseEntity.status(HttpStatus.OK).body(allStudents);
    }

    @PutMapping("/{id}")
    public ResponseEntity<StudentResponseDTO> updateStudent(
            @PathVariable UUID id,
            @Valid @RequestBody StudentRequestDTO studentRequestDTO) {
        StudentResponseDTO updatedStudent = studentService.updateStudent(id, studentRequestDTO);
        return ResponseEntity.ok(updatedStudent);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStudent(@PathVariable UUID id) {
        studentService.deleteStudent(id);
        return ResponseEntity.noContent().build();
    }
}
