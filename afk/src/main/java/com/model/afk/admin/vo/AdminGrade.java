package com.model.afk.admin.vo;

public class AdminGrade {
	
	public AdminGrade(){}
	
	private int g_No;
	private String g_Name;
	
	
	public AdminGrade(int g_No, String g_Name) {
		super();
		this.g_No = g_No;
		this.g_Name = g_Name;
	}
	
	
	
	public int getG_No() {
		return g_No;
	}
	public void setG_No(int g_No) {
		this.g_No = g_No;
	}
	public String getG_Name() {
		return g_Name;
	}
	public void setG_Name(String g_Name) {
		this.g_Name = g_Name;
	}



	@Override
	public String toString() {
		return "AdminGrade [g_No=" + g_No + ", g_Name=" + g_Name + "]";
	}
	
	
	
	
	
	
	


}
