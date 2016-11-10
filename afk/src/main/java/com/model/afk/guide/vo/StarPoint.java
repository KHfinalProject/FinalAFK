package com.model.afk.guide.vo;

public class StarPoint {
	//Field
	private int board_no; 
	private int point;
	private String mb_id;
	
	//Constructor
	public StarPoint(){}

	public StarPoint(int board_no, int point, String mb_id) {
		super();
		this.board_no = board_no;
		this.point = point;
		this.mb_id = mb_id;
	}

	//Getter & Setter
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	@Override
	public String toString() {
		return "StarPoint [board_no=" + board_no + ", point=" + point + ", mb_id=" + mb_id + "]";
	}
	

}
