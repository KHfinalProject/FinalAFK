package com.model.afk.member.vo;
import java.io.Serializable;
public class Member implements Serializable{
	private String mb_id;
	private String mb_pwd;
	private String mb_name;
	private String mb_email;
	private String mb_phone;
	private String mb_original_pic;
	private String mb_rename_pic;
	private String mb_bank;
	private String mb_loc_phone;
	private String mb_address;
	private String mb_grade;
	
	public Member(){}

	public Member(String mb_id, String mb_pwd, String mb_name, String mb_email, String mb_phone, String mb_original_pic,
			String mb_rename_pic, String mb_bank, String mb_loc_phone, String mb_address, String mb_grade) {
		super();
		this.mb_id = mb_id;
		this.mb_pwd = mb_pwd;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
		this.mb_original_pic = mb_original_pic;
		this.mb_rename_pic = mb_rename_pic;
		this.mb_bank = mb_bank;
		this.mb_loc_phone = mb_loc_phone;
		this.mb_address = mb_address;
		this.mb_grade = mb_grade;
	}
	
	
	
	public Member(String mb_id, String mb_pwd, String mb_name, String mb_email, String mb_phone) {
		super();
		this.mb_id = mb_id;
		this.mb_pwd = mb_pwd;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pwd() {
		return mb_pwd;
	}

	public void setMb_pwd(String mb_pwd) {
		this.mb_pwd = mb_pwd;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}

	public String getMb_original_pic() {
		return mb_original_pic;
	}

	public void setMb_original_pic(String mb_original_pic) {
		this.mb_original_pic = mb_original_pic;
	}

	public String getMb_rename_pic() {
		return mb_rename_pic;
	}

	public void setMb_rename_pic(String mb_rename_pic) {
		this.mb_rename_pic = mb_rename_pic;
	}

	public String getMb_bank() {
		return mb_bank;
	}

	public void setMb_bank(String mb_bank) {
		this.mb_bank = mb_bank;
	}

	public String getMb_loc_phone() {
		return mb_loc_phone;
	}

	public void setMb_loc_phone(String mb_loc_phone) {
		this.mb_loc_phone = mb_loc_phone;
	}

	public String getMb_address() {
		return mb_address;
	}

	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	@Override
	public String toString() {
		return "Member [mb_id=" + mb_id + ", mb_pwd=" + mb_pwd + ", mb_name=" + mb_name + ", mb_email=" + mb_email
				+ ", mb_phone=" + mb_phone + ", mb_original_pic=" + mb_original_pic + ", mb_rename_pic=" + mb_rename_pic
				+ ", mb_bank=" + mb_bank + ", mb_loc_phone=" + mb_loc_phone + ", mb_address=" + mb_address
				+ ", mb_grade=" + mb_grade + "]";
	}
	
	
	




}
