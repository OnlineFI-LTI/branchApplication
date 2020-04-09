package com.lti.hackathon.project.banking.locations.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.locations.api.entity.Transaction;

public interface TransactionRepository extends CrudRepository<Transaction, Long>{
  
	@Query ("select count(t) from transactions t where t.location.id = ?1 and t.transactionType= ?2")
    String countCashTransations(Long locationId, Integer transactionType );
	
	@Query ("select count(t) from transactions t where t.location.id = ?1 and t.transactionType= ?1")
    String countTransferTransations(Long locationId, Integer transactionType );
}
