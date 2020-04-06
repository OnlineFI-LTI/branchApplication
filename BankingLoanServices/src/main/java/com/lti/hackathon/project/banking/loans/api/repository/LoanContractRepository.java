package com.lti.hackathon.project.banking.loans.api.repository;

import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.LoanContract;

public interface LoanContractRepository extends CrudRepository<LoanContract, Long>{

}
