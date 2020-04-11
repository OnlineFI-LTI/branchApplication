package com.lti.hackathon.project.banking.locations.api.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.lti.hackathon.project.banking.locations.api.model.LoansResponseModel;
import com.lti.hackathon.project.banking.locations.api.model.LocationDetailsResponseModel;
import com.lti.hackathon.project.banking.locations.api.repository.TransactionRepository;
import com.lti.hackathon.project.banking.locations.api.shared.LoansServiceClient;

@Service
public class LocationDetailsServiceImpl implements LocationDetailsService {

	private static final Integer CASH_TRANS = 1;
	private static final Integer TRANSF_TRANS = 2;
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	private Environment environment;
	private LoansServiceClient loansServiceClient;
	private TransactionRepository transactionsRepository;

	@Autowired
	public LocationDetailsServiceImpl(Environment environment, LoansServiceClient loansServiceClient,
			TransactionRepository transactionsRepository) {
		this.environment = environment;
		this.loansServiceClient = loansServiceClient;
		this.transactionsRepository = transactionsRepository;
	}

	@Override
	public LocationDetailsResponseModel getLoanApplicationsDetails(String locationId) {
		LOGGER.info("Before calling loans Microservice");
		LoansResponseModel loansResponseModel = loansServiceClient.getLoanSummary(locationId);
		LOGGER.info("After calling loans Microservice");

		LocationDetailsResponseModel locationDetailsResponseModel = new LocationDetailsResponseModel();
		locationDetailsResponseModel.setNumberOfCashTransactionInAday(
				transactionsRepository.countCashTransations(Long.valueOf(locationId), CASH_TRANS));
		locationDetailsResponseModel.setNumberOfTransferTransactionInAday(
				transactionsRepository.countCashTransations(Long.valueOf(locationId), TRANSF_TRANS));
		locationDetailsResponseModel.setNumberOfLoanApplications(loansResponseModel.getNumberOfLoanApplications());
		locationDetailsResponseModel.setNumberOfLoanAccounts(loansResponseModel.getNumberOfLoanAccounts());
		locationDetailsResponseModel.setNumberOfCustomers(loansResponseModel.getNumberOfCustomers());
		locationDetailsResponseModel.setLoanAmountDisbursed(loansResponseModel.getLoanAmountDisbursed());

		return locationDetailsResponseModel;
	}

}
