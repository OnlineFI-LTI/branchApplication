package com.lti.hackathon.project.banking.locations.api.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "transactions")
public class Transaction {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long     id;
	
	private String   transactionNumber;
	
	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;
	
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date     transactionDate;
    
	private Integer  transactionType;  //CASH-1,TRANSFER-2,CLEARING-3
	private Integer  transactionAction; // REPAYMENT-1,DISBURSEMENT- 2
	
    @OneToMany(
            cascade = CascadeType.ALL,
            orphanRemoval = true
        )
	private List<TransactionDetail> transactionDetails = new ArrayList<TransactionDetail>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Integer getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(Integer transactionType) {
		this.transactionType = transactionType;
	}

	public Integer getTransactionAction() {
		return transactionAction;
	}

	public void setTransactionAction(Integer transactionAction) {
		this.transactionAction = transactionAction;
	}

	public List<TransactionDetail> getTransactionDetails() {
		return transactionDetails;
	}

	public void setTransactionDetails(List<TransactionDetail> transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

}

