package com.lti.hackathon.project.banking.loans.api.model;

import java.math.BigDecimal;

public class LoanDetailsSummaryResponseModel {

	private String numberOfLoanApplications;
	private String numberOfLoanAccounts;
	private String numberOfCustomers;
	private BigDecimal loanAmountDisbursed;

	
	public String getNumberOfLoanApplications() {
		return numberOfLoanApplications;
	}
	public void setNumberOfLoanApplications(String numberOfLoanApplications) {
		this.numberOfLoanApplications = numberOfLoanApplications;
	}
	public String getNumberOfLoanAccounts() {
		return numberOfLoanAccounts;
	}
	public void setNumberOfLoanAccounts(String numberOfLoanAccounts) {
		this.numberOfLoanAccounts = numberOfLoanAccounts;
	}
	public String getNumberOfCustomers() {
		return numberOfCustomers;
	}
	public void setNumberOfCustomers(String numberOfCustomers) {
		this.numberOfCustomers = numberOfCustomers;
	}
	public BigDecimal getLoanAmountDisbursed() {
		return loanAmountDisbursed;
	}
	public void setLoanAmountDisbursed(BigDecimal loanAmountDisbursed) {
		this.loanAmountDisbursed = loanAmountDisbursed;
	}
	
	
}
