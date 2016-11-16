package com.model.afk.infoboard.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InfoNotifyVO implements Serializable{
	
	public InfoNotifyVO(){}
	
	private int info_no;
	private String mb_id;
	
	public int getInfo_no() {
		return info_no;
	}
	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	@Override
	public String toString() {
		return "InfoNotifyVO [info_no=" + info_no + ", mb_id=" + mb_id + "]";
	}
	
	
	
}