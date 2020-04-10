package com.lti.hackathon.project.banking.loans.api.service;

import java.math.BigDecimal;
import java.util.Map;

import com.lti.hackathon.project.banking.loans.api.model.LoanDetailsSummaryResponseModel;

public interface LoanDetailsService {

	Map<String, BigDecimal> getLoanOutstandingAmount(Long locationId);

	Map<String, BigDecimal> getLoanOverdueAmount(Long locationId);
	LoanDetailsSummaryResponseModel getLoanDetails(String locationid);
}
