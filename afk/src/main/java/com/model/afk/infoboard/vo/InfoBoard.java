package com.model.afk.infoboard.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class InfoBoard implements java.io.Serializable{
	
	public InfoBoard(){}
	
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwrite;
	private Date bdate;
	private String blocL;
	private String blocM;
	private String blocS;
	private int bcount;
	private int bpoint;
	private int bnotify;
	private int bprice;
	private String bmap;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwrite() {
		return bwrite;
	}
	public void setBwrite(String bwrite) {
		this.bwrite = bwrite;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBlocL() {
		return blocL;
	}
	public void setBlocL(String blocL) {
		this.blocL = blocL;
	}
	public String getBlocM() {
		return blocM;
	}
	public void setBlocM(String blocM) {
		this.blocM = blocM;
	}
	public String getBlocS() {
		return blocS;
	}
	public void setBlocS(String blocS) {
		this.blocS = blocS;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBpoint() {
		return bpoint;
	}
	public void setBpoint(int bpoint) {
		this.bpoint = bpoint;
	}
	public int getBnotify() {
		return bnotify;
	}
	public void setBnotify(int bnotify) {
		this.bnotify = bnotify;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public String getBmap() {
		return bmap;
	}
	public void setBmap(String bmap) {
		this.bmap = bmap;
	}
	public InfoBoard(int bno, String btitle, String bcontent, String bwrite, Date bdate, String blocL, String blocM,
			String blocS, int bcount, int bpoint, int bnotify, int bprice, String bmap) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwrite = bwrite;
		this.bdate = bdate;
		this.blocL = blocL;
		this.blocM = blocM;
		this.blocS = blocS;
		this.bcount = bcount;
		this.bpoint = bpoint;
		this.bnotify = bnotify;
		this.bprice = bprice;
		this.bmap = bmap;
	}
	@Override
	public String toString() {
		return "InfoBoard [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwrite=" + bwrite
				+ ", bdate=" + bdate + ", blocL=" + blocL + ", blocM=" + blocM + ", blocS=" + blocS + ", bcount="
				+ bcount + ", bpoint=" + bpoint + ", bnotify=" + bnotify + ", bprice=" + bprice + ", bmap=" + bmap
				+ "]";
	}
	
	
	} 
