package com.lti.hackathon.project.banking.locations.api.model;

import java.math.BigDecimal;

public class LocationDetailsResponseModel {
	
	private String numberOfCashTransactionInAday;
	private String numberOfTransferTransactionInAday;
	
//	private LoansResponseModel loansResponseModel;
	private String numberOfLoanApplications;
	private String numberOfLoanAccounts;
	private String numberOfCustomers;
	private BigDecimal loanAmountDisbursed;
	
	
	public String getNumberOfCashTransactionInAday() {
		return numberOfCashTransactionInAday;
	}
	public void setNumberOfCashTransactionInAday(String numberOfCashTransactionInAday) {
		this.numberOfCashTransactionInAday = numberOfCashTransactionInAday;
	}
	public String getNumberOfTransferTransactionInAday() {
		return numberOfTransferTransactionInAday;
	}
	public void setNumberOfTransferTransactionInAday(String numberOfTransferTransactionInAday) {
		this.numberOfTransferTransactionInAday = numberOfTransferTransactionInAday;
	}
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
