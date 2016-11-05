package com.model.afk.guide.vo;

public class GuideComment implements java.io.Serializable {

	//Field
	private int cm_no; //댓글 번호
	private String cm_writer; //작성자
	private int cm_board_no; //댓글 달린 글 번호
	private String cm_content; //코멘트 내용
	
	private String mb_rename_pic;

	//Constructor
	public GuideComment(){}

	public GuideComment(int cm_no, String cm_writer, int cm_board_no, String cm_content) {
		super();
		this.cm_no = cm_no;
		this.cm_writer = cm_writer;
		this.cm_board_no = cm_board_no;
		this.cm_content = cm_content;
	}
	
	public GuideComment(int cm_no, String cm_writer, int cm_board_no, String cm_content, String mb_rename_pic) {
		super();
		this.cm_no = cm_no;
		this.cm_writer = cm_writer;
		this.cm_board_no = cm_board_no;
		this.cm_content = cm_content;
		this.mb_rename_pic = mb_rename_pic;
	}

	//Getter & Setter
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
	
	public String getMb_rename_pic() {
		return mb_rename_pic;
	}

	public void setMb_rename_pic(String mb_rename_pic) {
		this.mb_rename_pic = mb_rename_pic;
	}

	@Override
	public String toString() {
		return "GuideComment [cm_no=" + cm_no + ", cm_writer=" + cm_writer + ", cm_board_no=" + cm_board_no
				+ ", cm_content=" + cm_content + ", mb_rename_pic=" + mb_rename_pic + "]";
	}

	
	
}
