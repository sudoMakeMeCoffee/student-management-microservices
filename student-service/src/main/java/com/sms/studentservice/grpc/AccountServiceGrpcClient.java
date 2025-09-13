package com.sms.studentservice.grpc;

import account.AccountRequest;
import account.AccountResponse;
import account.AccountServiceGrpc;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class AccountServiceGrpcClient {
    private final AccountServiceGrpc.AccountServiceBlockingStub blockingStub;

    public AccountServiceGrpcClient(
            @Value("${account.service.address:localhost}") String serverAddress,
            @Value("${account.service.grpc.port:9002}") int serverPort
    ){

        log.info("Connecting to grpc server at {}:{}", serverAddress, serverPort);

        ManagedChannel channel = ManagedChannelBuilder.forAddress(serverAddress, serverPort).usePlaintext().build();

        blockingStub = AccountServiceGrpc.newBlockingStub(channel);
    }

    public AccountResponse createAccount(String studentId, String studentEmail){
        AccountRequest request = AccountRequest.newBuilder().setStudentId(studentId).setStudentEmail(studentEmail).build();
        AccountResponse response = blockingStub.createAccount(request);
        log.info("Received account request response: {}", response);
        return response;
    }
}
