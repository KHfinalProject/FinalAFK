package com.model.afk.member.vo;
import java.io.Serializable;
public class Member implements Serializable{
	private String mb_id;
	private String mb_pwd;
	private String mb_name;
	private String mb_email;
	private String mb_phone;
	
public Member(){}

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

@Override
public String toString() {
	return "Member [mb_id=" + mb_id + ", mb_pwd=" + mb_pwd + ", mb_name=" + mb_name + ", mb_email=" + mb_email
			+ ", mb_phone=" + mb_phone + "]";
}


}
