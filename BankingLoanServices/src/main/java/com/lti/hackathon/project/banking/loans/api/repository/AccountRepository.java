package com.lti.hackathon.project.banking.loans.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.Account;

public interface AccountRepository extends CrudRepository<Account, Long>{
	
	@Query("select p.name, sum(a.loanBalance) from accounts a inner join products p on a.product.id = p.id and a.location.id = ?1 group by a.product.id")
	public List<Object[]> getLoanOutstandingAmount(Long locationId);
	
	@Query ("select count(a) from accounts a where a.location.id = ?1")
    String countAccounts(Long locationId);
	
}
