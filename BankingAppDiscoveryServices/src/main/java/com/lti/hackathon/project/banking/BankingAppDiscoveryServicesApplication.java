package com.lti.hackathon.project.banking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class BankingAppDiscoveryServicesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BankingAppDiscoveryServicesApplication.class, args);
	}

}
