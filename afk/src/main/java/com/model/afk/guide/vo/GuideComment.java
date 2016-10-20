package com.model.afk.guide.vo;

public class GuideComment implements java.io.Serializable {

	//Field
	private int cmNo; //댓글 번호
	private String cmWriter; //작성자
	private int cmBoardNo; //댓글 달린 글 번호
	private String cmContent; //코멘트 내용

	//Constructor
	public GuideComment(){}
	
	public GuideComment(int cmNo, String cmWriter, int cmBoardNo, String cmContent) {
		super();
		this.cmNo = cmNo;
		this.cmWriter = cmWriter;
		this.cmBoardNo = cmBoardNo;
		this.cmContent = cmContent;
	}

	//Getter & Setter
	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public String getCmWriter() {
		return cmWriter;
	}

	public void setCmWriter(String cmWriter) {
		this.cmWriter = cmWriter;
	}

	public int getCmBoardNo() {
		return cmBoardNo;
	}

	public void setCmBoardNo(int cmBoardNo) {
		this.cmBoardNo = cmBoardNo;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	@Override
	public String toString() {
		return "GuideComment [cmNo=" + cmNo + ", cmWriter=" + cmWriter + ", cmBoardNo=" + cmBoardNo + ", cmContent="
				+ cmContent + "]";
	}
	
	
	
}
