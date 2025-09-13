package com.sms.studentservice.mapper;

import com.sms.studentservice.dto.StudentRequestDTO;
import com.sms.studentservice.dto.StudentResponseDTO;
import com.sms.studentservice.model.Student;

public class StudentMapper {

    public static StudentResponseDTO toDTO(Student student) {
        return StudentResponseDTO.builder()
                .id(student.getId())
                .name(student.getName())
                .email(student.getEmail())
                .phoneNumber(student.getPhoneNumber())
                .dateOfBirth(student.getDateOfBirth().toString())
                .build();
    }

    public static Student toModel(StudentRequestDTO studentRequestDTO) {
        return Student.builder()
                .name(studentRequestDTO.getName())
                .email(studentRequestDTO.getEmail())
                .phoneNumber(studentRequestDTO.getPhoneNumber())
                .dateOfBirth(studentRequestDTO.getDateOfBirth())
                .build();
    }

}
