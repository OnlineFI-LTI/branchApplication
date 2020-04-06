package com.lti.hackathon.project.banking.loans.api.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "products")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;

    @Column(nullable = false)
	private String productCode;
	
    @Column(nullable = false)
	private String name;
	
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date effectiveStartDate;
	
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
	private Date effectiveEndDate;

    @Column(nullable = false)
	private String	status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getEffectiveStartDate() {
		return effectiveStartDate;
	}

	public void setEffectiveStartDate(Date effectiveStartDate) {
		this.effectiveStartDate = effectiveStartDate;
	}

	public Date getEffectiveEndDate() {
		return effectiveEndDate;
	}

	public void setEffectiveEndDate(Date effectiveEndDate) {
		this.effectiveEndDate = effectiveEndDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
