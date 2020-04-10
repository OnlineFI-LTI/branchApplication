package com.lti.hackathon.project.banking.loans.api.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lti.hackathon.project.banking.loans.api.model.LoanDetailsSummaryResponseModel;
import com.lti.hackathon.project.banking.loans.api.repository.AccountRepository;
import com.lti.hackathon.project.banking.loans.api.repository.CustomerRepository;
import com.lti.hackathon.project.banking.loans.api.repository.LoanApplicationRepository;
import com.lti.hackathon.project.banking.loans.api.repository.LoanSchedulerRepository;
import com.lti.hackathon.project.banking.loans.api.service.LoanDetailsService;

@Service
public class LoanDetailsServiceImpl implements LoanDetailsService {

	private LoanSchedulerRepository loanSchedulerRepository;
	private AccountRepository accountRepository;
	private LoanApplicationRepository loanApplicationRepository;
	private CustomerRepository customerRepository;

	@Autowired
	public LoanDetailsServiceImpl(LoanSchedulerRepository loanSchedulerRepository, AccountRepository accountRepository,
			LoanApplicationRepository loanApplicationRepository, CustomerRepository customerRepository) {
		super();
		this.loanSchedulerRepository = loanSchedulerRepository;
		this.accountRepository = accountRepository;
		this.loanApplicationRepository = loanApplicationRepository;
		this.customerRepository = customerRepository;
		
	}

	@Override
	public Map<String, BigDecimal> getLoanOutstandingAmount(Long locationId) {
		List<Object[]> list = accountRepository.getLoanOutstandingAmount(locationId);
		Map<String, BigDecimal> map = list.stream()
				.collect(Collectors.toMap(a -> (String) a[0], a -> (BigDecimal) a[1]));
		return map;
	}

	@Override
	public Map<String, BigDecimal> getLoanOverdueAmount(Long locationId) {
		List<Object[]> list = loanSchedulerRepository.getLoanOverdueAmount(new Date(),locationId);
		Map<String, BigDecimal> map = list.stream()
				.collect(Collectors.toMap(a -> (String) a[0], a -> (BigDecimal) a[1]));
		return map;
	}

	@Override // TODO : data is hard coded
	public LoanDetailsSummaryResponseModel getLoanDetails(String locationId) {
		LoanDetailsSummaryResponseModel loanDetailsModel = new LoanDetailsSummaryResponseModel();
		loanDetailsModel.setNumberOfLoanApplications(loanApplicationRepository.countLoanApplications(Long.valueOf(locationId)));
		loanDetailsModel.setNumberOfLoanAccounts(accountRepository.countAccounts(Long.valueOf(locationId)));
		loanDetailsModel.setNumberOfCustomers(customerRepository.countAccounts(Long.valueOf(locationId)));
		BigDecimal loanAmountDisbursed = Optional.ofNullable(loanApplicationRepository.loanAmountDisbursedForADay(Long.valueOf(locationId))).orElse(BigDecimal.ZERO);
		loanDetailsModel.setLoanAmountDisbursed(loanAmountDisbursed);
		return loanDetailsModel;
	}
}
