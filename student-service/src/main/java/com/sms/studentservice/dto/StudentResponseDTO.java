package com.sms.studentservice.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class StudentResponseDTO {
    private UUID id;
    private String name;
    private String email;
    private String phoneNumber;
    private String dateOfBirth;
}
