package com.model.afk.myplanner.vo;

public class MyPlanner implements java.io.Serializable{
	private int plan_no;
	private String plan_writer;
	private String plan_title;
	private String plan_content;
	
	public MyPlanner(){}

	public MyPlanner(int plan_no, String plan_writer, String plan_title, String plan_content) {
		super();
		this.plan_no = plan_no;
		this.plan_writer = plan_writer;
		this.plan_title = plan_title;
		this.plan_content = plan_content;
	}

	public int getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}

	public String getPlan_writer() {
		return plan_writer;
	}

	public void setPlan_writer(String plan_writer) {
		this.plan_writer = plan_writer;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}

	public String getPlan_content() {
		return plan_content;
	}

	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}

	@Override
	public String toString() {
		return "MyPlanner [plan_no=" + plan_no + ", plan_writer=" + plan_writer + ", plan_title=" + plan_title
				+ ", plan_content=" + plan_content + "]";
	}
	
	
}
