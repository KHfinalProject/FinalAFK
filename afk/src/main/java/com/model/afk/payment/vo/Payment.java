package com.model.afk.payment.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {

	//Field
	private int payNo; //결제번호
	private String payId; //결제자 ID
	private String payName; //결제자 성명
	private String payPhone; //결제자 연락처
	private String payEmail; //결제자 이메일
	private int guideNo; //결제한 상품번호
	private String guideId; //결제한 상품의 담당 가이드 ID
	private int price; //결제가격
	private Date payDate; //결제일
	private char paid; //결제여부
	
	//Constructor
	public Payment(){}

	public Payment(int payNo, String payId, String payName, String payPhone, String payEmail, int guideNo,
			String guideId, int price, Date payDate, char paid) {
		super();
		this.payNo = payNo;
		this.payId = payId;
		this.payName = payName;
		this.payPhone = payPhone;
		this.payEmail = payEmail;
		this.guideNo = guideNo;
		this.guideId = guideId;
		this.price = price;
		this.payDate = payDate;
		this.paid = paid;
	}

	
	//Getter & Setter
	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getPayPhone() {
		return payPhone;
	}

	public void setPayPhone(String payPhone) {
		this.payPhone = payPhone;
	}

	public String getPayEmail() {
		return payEmail;
	}

	public void setPayEmail(String payEmail) {
		this.payEmail = payEmail;
	}

	public int getGuideNo() {
		return guideNo;
	}

	public void setGuideNo(int guideNo) {
		this.guideNo = guideNo;
	}

	public String getGuideId() {
		return guideId;
	}

	public void setGuideId(String guideId) {
		this.guideId = guideId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public char getPaid() {
		return paid;
	}

	public void setPaid(char paid) {
		this.paid = paid;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", payId=" + payId + ", payName=" + payName + ", payPhone=" + payPhone
				+ ", payEmail=" + payEmail + ", guideNo=" + guideNo + ", guideId=" + guideId + ", price=" + price
				+ ", payDate=" + payDate + ", paid=" + paid + "]";
	}


}
