package com.lti.hackathon.project.banking.loans.api.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "loan_contracts")
public class LoanContract {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String loanContractCode;

	@ManyToOne
	@JoinColumn(name = "account_id")
	private Account account = new Account();
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
	
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date effectiveDate;
    
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date loanApprovedDate;
    
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date loanEndDate;

	private Integer numberOfInstallments;

	private BigDecimal effectiveLoanAmount;
	private BigDecimal installmentAmount;
	private String status;
	private BigDecimal interestRate;
	private String loanApplicationNo;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoanContractCode() {
		return loanContractCode;
	}
	public void setLoanContractCode(String loanContractCode) {
		this.loanContractCode = loanContractCode;
	}
	
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public Date getLoanApprovedDate() {
		return loanApprovedDate;
	}
	public void setLoanApprovedDate(Date loanApprovedDate) {
		this.loanApprovedDate = loanApprovedDate;
	}
	public Date getLoanEndDate() {
		return loanEndDate;
	}
	public void setLoanEndDate(Date loanEndDate) {
		this.loanEndDate = loanEndDate;
	}
	
	public Integer getNumberOfInstallments() {
		return numberOfInstallments;
	}
	public void setNumberOfInstallments(Integer numberOfInstallments) {
		this.numberOfInstallments = numberOfInstallments;
	}

	public BigDecimal getEffectiveLoanAmount() {
		return effectiveLoanAmount;
	}
	public void setEffectiveLoanAmount(BigDecimal effectiveLoanAmount) {
		this.effectiveLoanAmount = effectiveLoanAmount;
	}
	public BigDecimal getInstallmentAmount() {
		return installmentAmount;
	}
	public void setInstallmentAmount(BigDecimal installmentAmount) {
		this.installmentAmount = installmentAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BigDecimal getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}
	public String getLoanApplicationNo() {
		return loanApplicationNo;
	}
	public void setLoanApplicationNo(String loanApplicationNo) {
		this.loanApplicationNo = loanApplicationNo;
	}
	
	
	
}
