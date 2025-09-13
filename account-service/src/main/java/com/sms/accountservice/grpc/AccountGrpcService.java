package com.sms.accountservice.grpc;

import account.AccountRequest;
import account.AccountResponse;
import account.AccountServiceGrpc.AccountServiceImplBase;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

@GrpcService
public class AccountGrpcService extends AccountServiceImplBase {
    @Override
    public void createAccount(AccountRequest accountRequest, StreamObserver<AccountResponse> responseObserver){
         AccountResponse response = AccountResponse.newBuilder()
                 .setAccountId("287284274282378239")
                 .build();

         responseObserver.onNext(response);
         responseObserver.onCompleted();

    }
}
