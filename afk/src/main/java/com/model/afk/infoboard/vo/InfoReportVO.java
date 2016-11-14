package com.model.afk.infoboard.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InfoReportVO implements Serializable{
	private int fa_id;			//즐겨찾기행 고유의 번호
	private String fa_mb_id;	//즐겨찾기 등록한 아이디
	private int fa_bd_no;		//즐겨찾기 등록한 글 번호
	
	public InfoReportVO(){}

	public InfoReportVO(int fa_id, String fa_mb_id, int fa_bd_no) {
		super();
		this.fa_id = fa_id;
		this.fa_mb_id = fa_mb_id;
		this.fa_bd_no = fa_bd_no;
	}

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
		return "InfoReportVO [fa_id=" + fa_id + ", fa_mb_id=" + fa_mb_id + ", fa_bd_no=" + fa_bd_no + "]";
	}
	
	
}