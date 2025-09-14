package com.sms.notificationservice.kafka;

import com.google.protobuf.InvalidProtocolBufferException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import student.events.StudentEvent;

@Service
public class KafkaConsumer {

    private static final Logger log = LoggerFactory.getLogger(
            KafkaConsumer.class);

    @KafkaListener(topics="student", groupId = "notification-service")
    public void consumeEvent(byte[] event) {
        try {
            StudentEvent studentEvent = StudentEvent.parseFrom(event);

            // perform any logic here

            log.info("Received Student Event: [Student Id={}, Student Email={}]",
                    studentEvent.getStudentId(),
                    studentEvent.getStudentEmail());
        } catch (InvalidProtocolBufferException e) {
            log.error("Error deserializing event {}", e.getMessage());
        }
    }
}

