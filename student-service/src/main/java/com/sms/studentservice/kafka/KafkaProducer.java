package com.sms.studentservice.kafka;

import com.sms.studentservice.model.Student;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import student.events.StudentEvent;

@Service
public class KafkaProducer {

    private static final Logger log = LoggerFactory.getLogger(KafkaProducer.class);
    private final KafkaTemplate<String, byte[]> kafkaTemplate;

    public KafkaProducer(KafkaTemplate<String, byte[]> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void sendEvent(Student student) {
        StudentEvent event = StudentEvent.newBuilder()
                .setStudentId(student.getId().toString())
                .setStudentEmail(student.getEmail())
                .setEventType("STUDENT_CREATED")
                .build();

        try{
            kafkaTemplate.send("student", event.toByteArray());
        }catch (Exception e){
            log.error("Error while sending event {}", event);
        }
    }
}
