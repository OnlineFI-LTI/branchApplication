package com.lti.hackathon.project.banking.loans.api.repository;

import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.LoanApplication;

public interface LoanApplicationRepository extends CrudRepository<LoanApplication, Long> {

}
