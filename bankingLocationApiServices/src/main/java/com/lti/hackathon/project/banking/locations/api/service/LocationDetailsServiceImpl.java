package com.lti.hackathon.project.banking.locations.api.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.lti.hackathon.project.banking.locations.api.model.LoansResponseModel;
import com.lti.hackathon.project.banking.locations.api.model.LocationDetailsResponseModel;
import com.lti.hackathon.project.banking.locations.api.repository.TransactionRepository;

@Service
public class LocationDetailsServiceImpl implements LocationDetailsService{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	Environment environment;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	TransactionRepository transactionsRepository;

	public static final Integer CASH_TRANS =1; 
	public static final Integer TRANSF_TRANS =2; 

	
	@Override
	public LocationDetailsResponseModel getLoanApplicationsDetails(String locationId) {
		logger.info("Before calling loans Microservice");
        String loansUrl = String.format(environment.getProperty("loans.summary.url"), locationId);
        ResponseEntity<LoansResponseModel> loansResponse = restTemplate.exchange(loansUrl, HttpMethod.GET, null, new ParameterizedTypeReference<LoansResponseModel>() {
        });
        LoansResponseModel loansResponseModel = loansResponse.getBody();
		 logger.info("After calling loans Microservice");
		
		 LocationDetailsResponseModel locationDetailsResponseModel = new LocationDetailsResponseModel(loansResponseModel);
		 locationDetailsResponseModel.setNumberOfCashTransactionInAday(transactionsRepository.countCashTransations(Long.valueOf(locationId), CASH_TRANS));
		 locationDetailsResponseModel.setNumberOfTransferTransactionInAday(transactionsRepository.countCashTransations(Long.valueOf(locationId), TRANSF_TRANS));
		return locationDetailsResponseModel;
	}

}
