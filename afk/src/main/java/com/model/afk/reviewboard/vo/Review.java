package com.model.afk.reviewboard.vo;

import java.sql.Date;

public class Review implements java.io.Serializable{
	private int rev_no;				//후기 게시글 번호
	private String rev_title;		//후기 게시물 제목
	private String rev_content;		//후기 게시물 내용
	private String rev_writer;		//후기 게시물 작성자
	private Date rev_enrolldate;	//후기 게시글 등록날짜
	private int rev_gui_no;			//관련 가이드 글 번호
	private int rev_count;			//후기 게시물 조회수
	private int rev_notify;			//후기 게시물 신고회수
	
	public Review(){}

	public Review(int rev_no, String rev_title, String rev_content, String rev_writer, Date rev_enrolldate,
			int rev_gui_no, int rev_count, int rev_notify) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_writer = rev_writer;
		this.rev_enrolldate = rev_enrolldate;
		this.rev_gui_no = rev_gui_no;
		this.rev_count = rev_count;
		this.rev_notify = rev_notify;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRev_writer() {
		return rev_writer;
	}

	public void setRev_writer(String rev_writer) {
		this.rev_writer = rev_writer;
	}

	public Date getRev_enrolldate() {
		return rev_enrolldate;
	}

	public void setRev_enrolldate(Date rev_enrolldate) {
		this.rev_enrolldate = rev_enrolldate;
	}

	public int getRev_gui_no() {
		return rev_gui_no;
	}

	public void setRev_gui_no(int rev_gui_no) {
		this.rev_gui_no = rev_gui_no;
	}

	public int getRev_count() {
		return rev_count;
	}

	public void setRev_count(int rev_count) {
		this.rev_count = rev_count;
	}

	public int getRev_notify() {
		return rev_notify;
	}

	public void setRev_notify(int rev_notify) {
		this.rev_notify = rev_notify;
	}

	@Override
	public String toString() {
		return "Review [rev_no=" + rev_no + ", rev_title=" + rev_title + ", rev_content=" + rev_content
				+ ", rev_writer=" + rev_writer + ", rev_enrolldate=" + rev_enrolldate + ", rev_gui_no=" + rev_gui_no
				+ ", rev_count=" + rev_count + ", rev_notify=" + rev_notify + "]";
	}
	
	
}
