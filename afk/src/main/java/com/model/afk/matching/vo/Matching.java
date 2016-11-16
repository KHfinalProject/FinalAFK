package com.model.afk.matching.vo;

import java.util.Date;

@SuppressWarnings("serial")
public class Matching implements java.io.Serializable{

	private int mat_no;	//매칭번호
	private Date mat_date;	//매칭날짜
	private int mat_gui_no;	//가이드 글 번호
	private String mat_mb_id;	//회원 아이디
	
	private String mb_name;	//구매한 유저 이름
	private String mb_phone;	//구매한 유저 전화번호
	private String departure_date;	//출발날짜
	private int travel_num;	//여행 인원수
	private int price;	//결제가격
	private Date pay_date;	//결제날짜
	private String gui_title;	//해당 가이드게시글 제목
	private int gui_no;	//해당 가이드게시글 번호
	private String guide_id;	//가이드 아이디
	private int pay_no;
	
	public Matching() {
		super();
	}

	public Matching(int mat_no, Date mat_date, int mat_gui_no, String mat_mb_id, String mb_name, String mb_phone,
			String departure_date, int travel_num, int price, Date pay_date, String gui_title, int gui_no, String guide_id, int pay_no) {
		super();
		this.mat_no = mat_no;
		this.mat_date = mat_date;
		this.mat_gui_no = mat_gui_no;
		this.mat_mb_id = mat_mb_id;
		this.mb_name = mb_name;
		this.mb_phone = mb_phone;
		this.departure_date = departure_date;
		this.travel_num = travel_num;
		this.price = price;
		this.pay_date = pay_date;
		this.gui_title = gui_title;
		this.gui_no = gui_no;
		this.guide_id = guide_id;
		this.pay_no = pay_no;
	}

	public int getMat_no() {
		return mat_no;
	}

	public void setMat_no(int mat_no) {
		this.mat_no = mat_no;
	}

	public Date getMat_date() {
		return mat_date;
	}

	public void setMat_date(Date mat_date) {
		this.mat_date = mat_date;
	}

	public int getMat_gui_no() {
		return mat_gui_no;
	}

	public void setMat_gui_no(int mat_gui_no) {
		this.mat_gui_no = mat_gui_no;
	}

	public String getMat_mb_id() {
		return mat_mb_id;
	}

	public void setMat_mb_id(String mat_mb_id) {
		this.mat_mb_id = mat_mb_id;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getGui_title() {
		return gui_title;
	}

	public void setGui_title(String gui_title) {
		this.gui_title = gui_title;
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
	
	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	@Override
	public String toString() {
		return "Matching [mat_no=" + mat_no + ", mat_date=" + mat_date + ", mat_gui_no=" + mat_gui_no + ", mat_mb_id="
				+ mat_mb_id + ", mb_name=" + mb_name + ", mb_phone=" + mb_phone + ", departure_date=" + departure_date
				+ ", travel_num=" + travel_num + ", price=" + price + ", pay_date=" + pay_date + ", gui_title="
				+ gui_title + ", gui_no=" + gui_no + ", guide_id=" + guide_id + ", pay_no=" + pay_no + "]";
	}
	
}
