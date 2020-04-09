package com.lti.hackathon.project.banking.loans.api.entity;

import java.math.BigDecimal;

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

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;
	
	private BigDecimal effectiveLoanAmount;
	
	private String disbursedFlag;
	
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

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getEffectiveLoanAmount() {
		return effectiveLoanAmount;
	}

	public void setEffectiveLoanAmount(BigDecimal effectiveLoanAmount) {
		this.effectiveLoanAmount = effectiveLoanAmount;
	}

	public String getDisbursedFlag() {
		return disbursedFlag;
	}

	public void setDisbursedFlag(String disbursedFlag) {
		this.disbursedFlag = disbursedFlag;
	}

}
