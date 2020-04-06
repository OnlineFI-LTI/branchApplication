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

@Entity(name = "loan_scheduler")
public class LoanScheduler {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "loan_contract_id")
	private LoanContract loanContract;
	
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date LoanEffectiveDate;
    
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date repaymentDate;
    
	private BigDecimal principalAmount;

	private BigDecimal interestAmount;
	
	private BigDecimal installmentAmount;
	
	private Integer repaymentDay;
	
	private BigDecimal loanBalance;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public LoanContract getLoanContract() {
		return loanContract;
	}
	public void setLoanContract(LoanContract loanContract) {
		this.loanContract = loanContract;
	}
	public Date getLoanEffectiveDate() {
		return LoanEffectiveDate;
	}
	public void setLoanEffectiveDate(Date loanEffectiveDate) {
		LoanEffectiveDate = loanEffectiveDate;
	}
	
	public Date getRepaymentDate() {
		return repaymentDate;
	}
	public void setRepaymentDate(Date repaymentDate) {
		this.repaymentDate = repaymentDate;
	}
	public BigDecimal getPrincipalAmount() {
		return principalAmount;
	}
	public void setPrincipalAmount(BigDecimal principalAmount) {
		this.principalAmount = principalAmount;
	}
	
	public BigDecimal getInterestAmount() {
		return interestAmount;
	}
	public void setInterestAmount(BigDecimal interestAmount) {
		this.interestAmount = interestAmount;
	}
	public BigDecimal getInstallmentAmount() {
		return installmentAmount;
	}
	public void setInstallmentAmount(BigDecimal installmentAmount) {
		this.installmentAmount = installmentAmount;
	}
	
	public Integer getRepaymentDay() {
		return repaymentDay;
	}
	public void setRepaymentDay(Integer repaymentDay) {
		this.repaymentDay = repaymentDay;
	}
	public BigDecimal getLoanBalance() {
		return loanBalance;
	}
	public void setLoanBalance(BigDecimal loanBalance) {
		this.loanBalance = loanBalance;
	}
	
}
