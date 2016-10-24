package com.model.afk.infoboard.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class InfoComment implements Serializable{
	
	public InfoComment(){}
	
	private int cno;
	private int bno;
	private String content;
	private String writeid;
	private Date cdate;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteid() {
		return writeid;
	}
	public void setWriteid(String writeid) {
		this.writeid = writeid;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public InfoComment(int cno, int bno, String content, String writeid, Date cdate) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.content = content;
		this.writeid = writeid;
		this.cdate = cdate;
	}
	@Override
	public String toString() {
		return "InfoComment [cno=" + cno + ", bno=" + bno + ", content=" + content + ", writeid=" + writeid + ", cdate="
				+ cdate + "]";
	}
	
	
	

} 
