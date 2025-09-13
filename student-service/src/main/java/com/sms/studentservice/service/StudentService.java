package com.sms.studentservice.service;

import com.sms.studentservice.dto.StudentRequestDTO;
import com.sms.studentservice.dto.StudentResponseDTO;
import com.sms.studentservice.exception.EmailAlreadyExistsException;
import com.sms.studentservice.exception.StudentNotFoundException;
import com.sms.studentservice.mapper.StudentMapper;
import com.sms.studentservice.model.Student;
import com.sms.studentservice.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

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

    public StudentResponseDTO updateStudent(UUID id, StudentRequestDTO studentRequestDTO) {
        Student existingStudent = studentRepository.findById(id)
                .orElseThrow(() -> new StudentNotFoundException("Student not found with id: " + id));

        // Check if email is being changed and already exists
        if (!existingStudent.getEmail().equals(studentRequestDTO.getEmail()) &&
                studentRepository.existsByEmail(studentRequestDTO.getEmail())) {
            throw new EmailAlreadyExistsException("Email already exists");
        }

        // Map updated fields
        existingStudent.setName(studentRequestDTO.getName());
        existingStudent.setEmail(studentRequestDTO.getEmail());
        existingStudent.setPhoneNumber(studentRequestDTO.getPhoneNumber());
        existingStudent.setDateOfBirth(studentRequestDTO.getDateOfBirth());

        return StudentMapper.toDTO(studentRepository.save(existingStudent));
    }

    public void deleteStudent(UUID id) {
        Student existingStudent = studentRepository.findById(id)
                .orElseThrow(() -> new StudentNotFoundException("Student not found with id: " + id));
        studentRepository.delete(existingStudent);
    }

}
