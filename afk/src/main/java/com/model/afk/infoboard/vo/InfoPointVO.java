package com.model.afk.infoboard.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InfoPointVO implements Serializable{

	public InfoPointVO(){}
	
	private int pbno;
	private int point;
	private String pwriter;
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPwriter() {
		return pwriter;
	}
	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}
	@Override
	public String toString() {
		return "InfoPoint [pbno=" + pbno + ", point=" + point + ", pwriter=" + pwriter + "]";
	}
	public InfoPointVO(int pbno, int point, String pwriter) {
		super();
		this.pbno = pbno;
		this.point = point;
		this.pwriter = pwriter;
	}
	
	
} 
