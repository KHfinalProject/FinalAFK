package com.model.afk.infoboard.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InfoNotify implements Serializable{
	
	public InfoNotify(){}
	
	private int nbno;
	private String nwriter;
	public int getNbno() {
		return nbno;
	}
	public void setNbno(int nbno) {
		this.nbno = nbno;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	@Override
	public String toString() {
		return "InfoNotify [nbno=" + nbno + ", nwriter=" + nwriter + "]";
	}
	public InfoNotify(int nbno, String nwriter) {
		super();
		this.nbno = nbno;
		this.nwriter = nwriter;
	}
	
	

} 
