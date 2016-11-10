package com.model.afk.guide.vo;

public class NotifyGItem {
	//Field
	private int board_no;
	private String mb_id;
	
	//Constructor
	public NotifyGItem(){}

	public NotifyGItem(int board_no, String mb_id) {
		super();
		this.board_no = board_no;
		this.mb_id = mb_id;
	}
	
	//Getter & Setter
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	@Override
	public String toString() {
		return "NotifyGItem [board_no=" + board_no + ", mb_id=" + mb_id + "]";
	}
	
	
}
