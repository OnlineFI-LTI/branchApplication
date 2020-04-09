package com.lti.hackathon.project.banking.loans.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long>{
	
	@Query ("select count(c) from t_customers c where c.location.id = ?1")
    String countAccounts(Long locationId);
}
