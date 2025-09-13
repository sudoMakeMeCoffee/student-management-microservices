package com.sms.studentservice.controller;

import com.sms.studentservice.dto.StudentRequestDTO;
import com.sms.studentservice.dto.StudentResponseDTO;
import com.sms.studentservice.service.StudentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
