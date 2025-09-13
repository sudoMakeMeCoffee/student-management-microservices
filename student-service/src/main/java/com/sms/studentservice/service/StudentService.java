package com.sms.studentservice.service;

import com.sms.studentservice.dto.StudentRequestDTO;
import com.sms.studentservice.dto.StudentResponseDTO;
import com.sms.studentservice.exception.EmailAlreadyExistsException;
import com.sms.studentservice.mapper.StudentMapper;
import com.sms.studentservice.model.Student;
import com.sms.studentservice.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StudentService {
    private final StudentRepository studentRepository;

    public StudentResponseDTO createStudent(StudentRequestDTO studentRequestDTO) {

        boolean isEmailAlreadyExists = studentRepository.existsByEmail(studentRequestDTO.getEmail());

        if (isEmailAlreadyExists) {
            throw new EmailAlreadyExistsException("Email already exists");
        }

        return StudentMapper.toDTO(studentRepository.save(StudentMapper.toModel(studentRequestDTO)));
    }

    public List<StudentResponseDTO> getAllStudents() {
        return  studentRepository.findAll().stream().map(StudentMapper::toDTO).toList();
    }

}
