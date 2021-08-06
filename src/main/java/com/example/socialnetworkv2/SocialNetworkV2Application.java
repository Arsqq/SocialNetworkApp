package com.example.socialnetworkv2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class SocialNetworkV2Application {

    public static void main(String[] args) {
        SpringApplication.run(SocialNetworkV2Application.class, args);
    }

}
