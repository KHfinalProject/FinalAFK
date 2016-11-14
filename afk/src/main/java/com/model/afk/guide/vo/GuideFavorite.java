package com.model.afk.guide.vo;

public class GuideFavorite {
	//Field
	private int fa_id;
	private String fa_mb_id;
	private int fa_bd_no;
	
	//Constructor
	public GuideFavorite(){}

	public GuideFavorite(int fa_id, String fa_mb_id, int fa_bd_no) {
		super();
		this.fa_id = fa_id;
		this.fa_mb_id = fa_mb_id;
		this.fa_bd_no = fa_bd_no;
	}

	//Getter & Setter
	public int getFa_id() {
		return fa_id;
	}

	public void setFa_id(int fa_id) {
		this.fa_id = fa_id;
	}

	public String getFa_mb_id() {
		return fa_mb_id;
	}

	public void setFa_mb_id(String fa_mb_id) {
		this.fa_mb_id = fa_mb_id;
	}

	public int getFa_bd_no() {
		return fa_bd_no;
	}

	public void setFa_bd_no(int fa_bd_no) {
		this.fa_bd_no = fa_bd_no;
	}

	@Override
	public String toString() {
		return "GuideFavorite [fa_id=" + fa_id + ", fa_mb_id=" + fa_mb_id + ", fa_bd_no=" + fa_bd_no + "]";
	}
	

}
