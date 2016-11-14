package com.model.afk.infoboard.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class InfoCommentVO implements Serializable{
	private int cm_no;
	private String cm_writer;
	private int cm_board_no;
	private String cm_content;
	private Date cm_date;
	
	public InfoCommentVO(){}

	public InfoCommentVO(int cm_no, String cm_writer, int cm_board_no, String cm_content, Date cm_date) {
		super();
		this.cm_no = cm_no;
		this.cm_writer = cm_writer;
		this.cm_board_no = cm_board_no;
		this.cm_content = cm_content;
		this.cm_date = cm_date;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public String getCm_writer() {
		return cm_writer;
	}

	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}

	public int getCm_board_no() {
		return cm_board_no;
	}

	public void setCm_board_no(int cm_board_no) {
		this.cm_board_no = cm_board_no;
	}

	public String getCm_content() {
		return cm_content;
	}

	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}

	public Date getCm_date() {
		return cm_date;
	}

	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}

	@Override
	public String toString() {
		return "InfoCommentVO [cm_no=" + cm_no + ", cm_writer=" + cm_writer + ", cm_board_no=" + cm_board_no
				+ ", cm_content=" + cm_content + ", cm_date=" + cm_date + "]";
	}

} 
