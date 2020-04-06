package com.lti.hackathon.project.banking.loans.api.model;

import java.math.BigDecimal;
import java.util.Map;

public class LoanDetailsResponseModel {
	
	Map<String,BigDecimal> loanDetails;

	public Map<String, BigDecimal> getLoanDetails() {
		return loanDetails;
	}

	public void setLoanDetails(Map<String, BigDecimal> loanDetails) {
		this.loanDetails = loanDetails;
	}
	
	
}
