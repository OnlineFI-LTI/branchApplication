package com.lti.hackathon.project.banking.loans.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

import com.lti.hackathon.project.banking.loans.api.repository.LoanApplicationRepository;
import com.lti.hackathon.project.banking.loans.api.repository.ProductRepository;

@SpringBootApplication
@EnableDiscoveryClient
public class BankingLoanServicesApplication {

	private static final Logger log = LoggerFactory.getLogger(BankingLoanServicesApplication.class);
	
	public static void main(String[] args) {
		SpringApplication.run(BankingLoanServicesApplication.class, args);
	}

}
