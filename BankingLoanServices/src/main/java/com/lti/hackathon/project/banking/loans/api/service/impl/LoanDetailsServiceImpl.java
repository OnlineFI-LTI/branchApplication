package com.lti.hackathon.project.banking.loans.api.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lti.hackathon.project.banking.loans.api.model.LoanDetailsSummaryResponseModel;
import com.lti.hackathon.project.banking.loans.api.repository.AccountRepository;
import com.lti.hackathon.project.banking.loans.api.repository.LoanSchedulerRepository;
import com.lti.hackathon.project.banking.loans.api.service.LoanDetailsService;

@Service
public class LoanDetailsServiceImpl implements LoanDetailsService{
	
	private LoanSchedulerRepository loanSchedulerRepository;
	private AccountRepository accountRepository;
	
	@Autowired
	public LoanDetailsServiceImpl(LoanSchedulerRepository loanSchedulerRepository,
			AccountRepository accountRepository) {
		super();
		this.loanSchedulerRepository = loanSchedulerRepository;
		this.accountRepository = accountRepository;
	}
	
	@Override
	public Map<String, BigDecimal> getLoanOutstandingAmount(){
		List<Object[]> list = accountRepository.getLoanOutstandingAmount();
		Map<String, BigDecimal> map = list.stream().collect(Collectors.toMap(a -> (String)a[0], a -> (BigDecimal) a[1]));
		return map;
	}
	
	@Override
	public Map<String,BigDecimal> getLoanOverdueAmount(){
		List<Object[]> list = loanSchedulerRepository.getLoanOverdueAmount(new Date());
		Map<String, BigDecimal> map = list.stream().collect(Collectors.toMap(a -> (String)a[0], a -> (BigDecimal) a[1]));
		return map;
	}

	@Override//TODO : data is hard coded
	public LoanDetailsSummaryResponseModel getLoanDetails() {
		LoanDetailsSummaryResponseModel loanDetailsModel = new LoanDetailsSummaryResponseModel();
		loanDetailsModel.setNumberOfLoanApplications("312");
		loanDetailsModel.setNumberOfLoanAccounts("434");
		loanDetailsModel.setNumberOfCustomers("434");
		loanDetailsModel.setNumberOfLoanAcountDisbursed("23");
		return loanDetailsModel;
	}
}
