package com.lti.hackathon.project.banking.loans.api.service;

import java.math.BigDecimal;
import java.util.Map;

import com.lti.hackathon.project.banking.loans.api.model.LoanDetailsSummaryResponseModel;

public interface LoanDetailsService {

	Map<String, BigDecimal> getLoanOutstandingAmount();

	Map<String, BigDecimal> getLoanOverdueAmount();
	LoanDetailsSummaryResponseModel getLoanDetails(String locationid);
}
