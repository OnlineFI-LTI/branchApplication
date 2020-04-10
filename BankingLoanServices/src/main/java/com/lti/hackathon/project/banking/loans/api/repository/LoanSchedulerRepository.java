package com.lti.hackathon.project.banking.loans.api.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.LoanScheduler;

public interface LoanSchedulerRepository extends CrudRepository<LoanScheduler, Long> {

	 @Query(value = "select  p.name, sum(a.loan_balance - s.loan_balance) overdue from loan_scheduler s\r\n" + 
	 		"INNER JOIN loan_contracts lc ON s.loan_contract_id=lc.id\r\n" + 
	 		"INNER JOIN accounts a ON lc.account_id=a.id\r\n" + 
	 		"INNER JOIN products p ON a.product_id=p.id where s.loan_contract_id=lc.id and  lc.account_id=a.id and a.product_id=p.id and a.location_id= ?2 and s.repayment_date\r\n" + 
	 		" in (SELECT MAX(s1.repayment_date) \r\n" + 
	 		"			 FROM loan_scheduler s1\r\n" + 
	 		"			  WHERE s1.repayment_date < ?1 group by s1.loan_contract_id) group by p.id", nativeQuery = true)
	public List<Object[]> getLoanOverdueAmount(Date currentDate, Long locationId);
}
