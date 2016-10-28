package com.model.afk.guide.vo;


public class Test implements java.io.Serializable{
	
	private int col;
	private String title;
	
	public Test(){}

	public Test(int col, String title) {
		super();
		this.col = col;
		this.title = title;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
	
}
