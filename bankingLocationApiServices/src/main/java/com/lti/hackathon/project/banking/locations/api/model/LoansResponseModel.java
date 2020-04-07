package com.lti.hackathon.project.banking.locations.api.model;

public class LoansResponseModel {
	
	private String numberOfLoanApplications;
	private String numberOfLoanAccounts;
	private String numberOfCustomers;
	private String numberOfLoanAcountDisbursed;

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
	public String getNumberOfLoanAcountDisbursed() {
		return numberOfLoanAcountDisbursed;
	}
	public void setNumberOfLoanAcountDisbursed(String numberOfLoanAcountDisbursed) {
		this.numberOfLoanAcountDisbursed = numberOfLoanAcountDisbursed;
	}
	
	

}
