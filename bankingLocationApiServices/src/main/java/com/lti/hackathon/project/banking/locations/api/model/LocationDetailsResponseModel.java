package com.lti.hackathon.project.banking.locations.api.model;

public class LocationDetailsResponseModel {
	
	private String numberOfCashTransactionInAday;
	private String numberOfTransferTransactionInAday;
	
	private LoansResponseModel loansResponseModel;
	
	public LocationDetailsResponseModel(LoansResponseModel loansResponseModel) {
		this.loansResponseModel = loansResponseModel;
	}

	public LoansResponseModel getLoansResponseModel() {
		return loansResponseModel;
	}

	public void setLoansResponseModel(LoansResponseModel loansResponseModel) {
		this.loansResponseModel = loansResponseModel;
	}

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



}
