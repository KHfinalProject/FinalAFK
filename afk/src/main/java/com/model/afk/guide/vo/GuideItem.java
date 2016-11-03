package com.model.afk.guide.vo;

import java.sql.Date;

public class GuideItem implements java.io.Serializable {

	// Field
	private int gui_no; // 가이드 글번호
	private String gui_title; // 가이드 글 제목
	private String gui_content; // 가이드 글 내용
	private String gui_writer; // 가이드 글 작성자 ID
	private Date gui_enrolldate; // 가이드 글 등록일
	private String gui_loc_l; // 지역분류 대
	private String gui_loc_m; // 지역분류 중
	private String gui_loc_s; // 지역분류 소
	private int gui_count; // 조회수
	private int gui_point; // 별점
	private int gui_notify; // 신고횟수
	private int gui_price; // 상품가격
	private String gui_map; // 지도 정보
	private String gui_image; // 사진
	private String gui_date; // 가이드 가능한 날짜들

	// Constructor
	public GuideItem() {
	}

	public GuideItem(int gui_no, String gui_title, String gui_content, String gui_writer, Date gui_enrolldate,
			String gui_loc_l, String gui_loc_m, String gui_loc_s, int gui_count, int gui_point, int gui_notify,
			int gui_price, String gui_map, String gui_image, String gui_date) {
		super();
		this.gui_no = gui_no;
		this.gui_title = gui_title;
		this.gui_content = gui_content;
		this.gui_writer = gui_writer;
		this.gui_enrolldate = gui_enrolldate;
		this.gui_loc_l = gui_loc_l;
		this.gui_loc_m = gui_loc_m;
		this.gui_loc_s = gui_loc_s;
		this.gui_count = gui_count;
		this.gui_point = gui_point;
		this.gui_notify = gui_notify;
		this.gui_price = gui_price;
		this.gui_map = gui_map;
		this.gui_image = gui_image;
		this.gui_date = gui_date;
	}

	// Getter & Setter

	public int getGui_no() {
		return gui_no;
	}

	public void setGui_no(int gui_no) {
		this.gui_no = gui_no;
	}

	public String getGui_title() {
		return gui_title;
	}

	public void setGui_title(String gui_title) {
		this.gui_title = gui_title;
	}

	public String getGui_content() {
		return gui_content;
	}

	public void setGui_content(String gui_content) {
		this.gui_content = gui_content;
	}

	public String getGui_writer() {
		return gui_writer;
	}

	public void setGui_writer(String gui_writer) {
		this.gui_writer = gui_writer;
	}

	public Date getGui_enrolldate() {
		return gui_enrolldate;
	}

	public void setGui_enrolldate(Date gui_enrolldate) {
		this.gui_enrolldate = gui_enrolldate;
	}

	public String getGui_loc_l() {
		return gui_loc_l;
	}

	public void setGui_loc_l(String gui_loc_l) {
		this.gui_loc_l = gui_loc_l;
	}

	public String getGui_loc_m() {
		return gui_loc_m;
	}

	public void setGui_loc_m(String gui_loc_m) {
		this.gui_loc_m = gui_loc_m;
	}

	public String getGui_loc_s() {
		return gui_loc_s;
	}

	public void setGui_loc_s(String gui_loc_s) {
		this.gui_loc_s = gui_loc_s;
	}

	public int getGui_count() {
		return gui_count;
	}

	public void setGui_count(int gui_count) {
		this.gui_count = gui_count;
	}

	public int getGui_point() {
		return gui_point;
	}

	public void setGui_point(int gui_point) {
		this.gui_point = gui_point;
	}

	public int getGui_notify() {
		return gui_notify;
	}

	public void setGui_notify(int gui_notify) {
		this.gui_notify = gui_notify;
	}

	public int getGui_price() {
		return gui_price;
	}

	public void setGui_price(int gui_price) {
		this.gui_price = gui_price;
	}

	public String getGui_map() {
		return gui_map;
	}

	public void setGui_map(String gui_map) {
		this.gui_map = gui_map;
	}

	public String getGui_image() {
		return gui_image;
	}

	public void setGui_image(String gui_image) {
		this.gui_image = gui_image;
	}

	public String getGui_date() {
		return gui_date;
	}

	public void setGui_date(String gui_date) {
		this.gui_date = gui_date;
	}

	@Override
	public String toString() {
		return "GuideItem [gui_no=" + gui_no + ", gui_title=" + gui_title + ", gui_content=" + gui_content
				+ ", gui_writer=" + gui_writer + ", gui_enrolldate=" + gui_enrolldate + ", gui_loc_l=" + gui_loc_l
				+ ", gui_loc_m=" + gui_loc_m + ", gui_loc_s=" + gui_loc_s + ", gui_count=" + gui_count + ", gui_point="
				+ gui_point + ", gui_notify=" + gui_notify + ", gui_price=" + gui_price + ", gui_map=" + gui_map
				+ ", gui_image=" + gui_image + ", gui_date=" + gui_date + "]";
	}
	
	
}