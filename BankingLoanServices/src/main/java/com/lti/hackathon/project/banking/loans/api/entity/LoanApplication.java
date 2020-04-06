package com.lti.hackathon.project.banking.loans.api.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "loan_aplications")
public class LoanApplication {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	private String loanApplicationNumber;
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	public String getLoanApplicationNumber() {
		return loanApplicationNumber;
	}

	public void setLoanApplicationNumber(String loanApplicationNumber) {
		this.loanApplicationNumber = loanApplicationNumber;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
