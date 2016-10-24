package com.model.afk.infoboard.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InfoReport implements Serializable{

	public InfoReport(){}
	
	private int fno;
	private String fwriter;
	private int fbno;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFwriter() {
		return fwriter;
	}
	public void setFwriter(String fwriter) {
		this.fwriter = fwriter;
	}
	public int getFbno() {
		return fbno;
	}
	public void setFbno(int fbno) {
		this.fbno = fbno;
	}
	public InfoReport(int fno, String fwriter, int fbno) {
		super();
		this.fno = fno;
		this.fwriter = fwriter;
		this.fbno = fbno;
	}
	@Override
	public String toString() {
		return "InfoReport [fno=" + fno + ", fwriter=" + fwriter + ", fbno=" + fbno + "]";
	}
	
	
} 
