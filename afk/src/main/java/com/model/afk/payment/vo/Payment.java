package com.model.afk.payment.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {

	//Field
	private int pay_no; //결제번호
	private String pay_id; //결제자 ID
	private String pay_name; //결제자 성명
	private String pay_phone; //결제자 연락처
	private String pay_email; //결제자 이메일
	private int gui_no; //결제한 상품번호
	private String guide_id; //결제한 상품의 담당 가이드 ID
	private int price; //결제가격
	private String departure_date; //사용자가 선택한 출발일
	private int travel_num; //출발인원
	private Date pay_date; //결제일
	private char paid; //결제여부
	
	//Constructor
	public Payment(){}

	public Payment(int pay_no, String pay_id, String pay_name, String pay_phone, String pay_email, int gui_no,
			String guide_id, int price, String departure_date, int travel_num, Date pay_date, char paid) {
		super();
		this.pay_no = pay_no;
		this.pay_id = pay_id;
		this.pay_name = pay_name;
		this.pay_phone = pay_phone;
		this.pay_email = pay_email;
		this.gui_no = gui_no;
		this.guide_id = guide_id;
		this.price = price;
		this.departure_date = departure_date;
		this.travel_num = travel_num;
		this.pay_date = pay_date;
		this.paid = paid;
	}

	//Getter & Setter
	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public String getPay_phone() {
		return pay_phone;
	}

	public void setPay_phone(String pay_phone) {
		this.pay_phone = pay_phone;
	}

	public String getPay_email() {
		return pay_email;
	}

	public void setPay_email(String pay_email) {
		this.pay_email = pay_email;
	}

	public int getGui_no() {
		return gui_no;
	}

	public void setGui_no(int gui_no) {
		this.gui_no = gui_no;
	}

	public String getGuide_id() {
		return guide_id;
	}

	public void setGuide_id(String guide_id) {
		this.guide_id = guide_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDeparture_date() {
		return departure_date;
	}

	public void setDeparture_date(String departure_date) {
		this.departure_date = departure_date;
	}

	public int getTravel_num() {
		return travel_num;
	}

	public void setTravel_num(int travel_num) {
		this.travel_num = travel_num;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public char getPaid() {
		return paid;
	}

	public void setPaid(char paid) {
		this.paid = paid;
	}

	@Override
	public String toString() {
		return "Payment [pay_no=" + pay_no + ", pay_id=" + pay_id + ", pay_name=" + pay_name + ", pay_phone="
				+ pay_phone + ", pay_email=" + pay_email + ", gui_no=" + gui_no + ", guide_id=" + guide_id + ", price="
				+ price + ", departure_date=" + departure_date + ", travel_num=" + travel_num + ", pay_date="
				+ pay_date + ", paid=" + paid + "]";
	}	

}
