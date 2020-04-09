package com.lti.hackathon.project.banking.loans.api.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.LoanApplication;

public interface LoanApplicationRepository extends CrudRepository<LoanApplication, Long> {

	@Query ("select count(l) from loan_aplications l where l.location.id = ?1")
    String countLoanApplications(Long locationId);
	
	@Query("select SUM(l.effectiveLoanAmount) from loan_aplications l where l.location.id = ?1 and l.disbursedFlag='Y'")
	BigDecimal loanAmountDisbursedForADay(Long locationId);
}
