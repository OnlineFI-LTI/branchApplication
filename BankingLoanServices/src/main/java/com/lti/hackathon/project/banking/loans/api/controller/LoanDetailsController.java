package com.lti.hackathon.project.banking.loans.api.controller;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lti.hackathon.project.banking.loans.api.model.LoanDetailsSummaryResponseModel;
import com.lti.hackathon.project.banking.loans.api.service.LoanDetailsService;

@RestController
@RequestMapping("/loans")
public class LoanDetailsController {

	@Autowired
	private LoanDetailsService loanDetailsService;

	@GetMapping("/status/check")
	public String getloanDetails() {

		/*
		 * loanDetailsService.getLoanOutstandingAmount();
		 * loanDetailsService.getLoanOverdueAmount();
		 */
		return "it works";
	}

	@GetMapping(value = "/loanOutstandings/{locationId}")
	public Map<String, BigDecimal> getBranchLoanOutstandingsDetails(@PathVariable("locationId") String locationId) {

		Map<String, BigDecimal> loanDetailsResponse = loanDetailsService.getLoanOutstandingAmount(Long.valueOf(locationId));

		return loanDetailsResponse;
	}
	
	@GetMapping(value = "/loanOverdues/{locationId}")
	public Map<String, BigDecimal> getBranchLoanOverdueDetails(@PathVariable("locationId") String locationId) {
		Map<String, BigDecimal> loanDetailsResponse = loanDetailsService.getLoanOverdueAmount(Long.valueOf(locationId));
		return loanDetailsResponse;
	}
	
	@GetMapping(value = "/loansSummary/{locationId}")
	public LoanDetailsSummaryResponseModel getLoanSummaryDetails(@PathVariable("locationId") String locationid) {
		LoanDetailsSummaryResponseModel responseModel = loanDetailsService.getLoanDetails(locationid);
		return responseModel;
	}
}
