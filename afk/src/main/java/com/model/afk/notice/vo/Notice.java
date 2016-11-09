package com.model.afk.notice.vo;

import java.sql.Date;

public class Notice {
	private String notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_enrolldate;
	private int notice_count;
	private String notice_writer;
	public Notice(){}
	public Notice(String notice_no, String notice_title, String notice_content, int notice_count,
			String notice_writer) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_count = notice_count;
		this.notice_writer = notice_writer;
		
	}
	public Notice(String notice_no, String notice_title, String notice_content, Date notice_enrolldate,
			int notice_count, String notice_writer) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_enrolldate = notice_enrolldate;
		this.notice_count = notice_count;
		this.notice_writer = notice_writer;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_enrolldate() {
		return notice_enrolldate;
	}
	public void setNotice_enrolldate(Date notice_enrolldate) {
		this.notice_enrolldate = notice_enrolldate;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_enrolldate=" + notice_enrolldate + ", notice_count=" + notice_count
				+ ", notice_writer=" + notice_writer + "]";
	}
	
}