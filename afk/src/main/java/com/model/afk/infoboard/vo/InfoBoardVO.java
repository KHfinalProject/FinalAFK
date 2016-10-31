package com.model.afk.infoboard.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class InfoBoardVO implements java.io.Serializable{
	
	public InfoBoardVO(){}
	
	private int info_no;
	private String info_title;
	private String info_content;
	private String info_writer;
	private Date info_enrolldate;
	private String info_loc_l;
	private String info_loc_m;
	private String info_loc_s;
	private int info_count;
	private int info_point;
	private int info_notify;
	private int info_price;
	private String info_map;
	public int getInfo_no() {
		return info_no;
	}
	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getInfo_content() {
		return info_content;
	}
	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
	public String getInfo_writer() {
		return info_writer;
	}
	public void setInfo_write(String info_write) {
		this.info_writer = info_write;
	}
	public Date getInfo_enrolldate() {
		return info_enrolldate;
	}
	public void setInfo_enrolldate(Date info_enrolldate) {
		this.info_enrolldate = info_enrolldate;
	}
	public String getInfo_locl() {
		return info_loc_l;
	}
	public void setInfolocL(String info_loc_l) {
		this.info_loc_l = info_loc_l;
	}
	public String getInfo_loc_m() {
		return info_loc_m;
	}
	public void setInfo_loc_m(String info_loc_m) {
		this.info_loc_m = info_loc_m;
	}
	public String getInfo_loc_s() {
		return info_loc_s;
	}
	public void setInfo_loc_s(String info_loc_s) {
		this.info_loc_s = info_loc_s;
	}
	public int getInfo_count() {
		return info_count;
	}
	public void setInfo_count(int info_count) {
		this.info_count = info_count;
	}
	public int getInfo_point() {
		return info_point;
	}
	public void setInfo_point(int info_point) {
		this.info_point = info_point;
	}
	public int getInfo_notify() {
		return info_notify;
	}
	public void setInfo_notify(int info_notify) {
		this.info_notify = info_notify;
	}
	public int getInfo_price() {
		return info_price;
	}
	public void setInfo_price(int info_price) {
		this.info_price = info_price;
	}
	public String getInfo_map() {
		return info_map;
	}
	public void setInfo_map(String info_map) {
		this.info_map = info_map;
	}
	public InfoBoardVO(int bno, String info_title, String info_content, String info_write, Date info_enrolldate, String info_loc_l, String info_loc_m,
			String info_loc_s, int info_count, int info_point, int info_notify, int info_price, String info_map) {
		super();
		this.info_no = bno;
		this.info_title = info_title;
		this.info_content = info_content;
		this.info_writer = info_write;
		this.info_enrolldate = info_enrolldate;
		this.info_loc_l = info_loc_l;
		this.info_loc_m = info_loc_m;
		this.info_loc_s = info_loc_s;
		this.info_count = info_count;
		this.info_point = info_point;
		this.info_notify = info_notify;
		this.info_price = info_price;
		this.info_map = info_map;
	}
	@Override
	public String toString() {
		return "InfoBoardVO [bno=" + info_no + ", btitle=" + info_title + ", bcontent=" + info_content + ", bwrite=" + info_writer
				+ ", bdate=" + info_enrolldate + ", blocL=" + info_loc_l + ", blocM=" + info_loc_m + ", blocS=" + info_loc_s + ", bcount="
				+ info_count + ", bpoint=" + info_point + ", bnotify=" + info_notify + ", bprice=" + info_price + ", bmap=" + info_map
				+ "]";
	}
	
	
	} 
