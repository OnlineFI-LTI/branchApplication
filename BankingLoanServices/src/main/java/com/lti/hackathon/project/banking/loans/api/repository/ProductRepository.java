package com.lti.hackathon.project.banking.loans.api.repository;

import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.loans.api.entity.Product;

public interface ProductRepository extends CrudRepository<Product, Long>{

}
