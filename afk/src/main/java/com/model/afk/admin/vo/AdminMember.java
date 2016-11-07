package com.model.afk.admin.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminMember implements Serializable{
	
	public AdminMember(){}
	
	private String memberId;
    private String memberPwd;
    private String memberName;
    private String memberEmail;
    private String memberPhone;
    private Date memberJoinDate;
    private String memberOriginalPic;
    private String memberRenamePic;
    private String memberBank;
    private String memberLocPhone;
	private String memberAddress;
    private String memberGrade;
    
    
	public AdminMember(String memberId, String memberPwd, String memberName, String memberEmail, String memberPhone,
			Date memberJoinDate, String memberOriginalPic, String memberRenamePic, String memberBank,
			String memberLocPhone, String memberAddress, String memberGrade) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberJoinDate = memberJoinDate;
		this.memberOriginalPic = memberOriginalPic;
		this.memberRenamePic = memberRenamePic;
		this.memberBank = memberBank;
		this.memberLocPhone = memberLocPhone;
		this.memberAddress = memberAddress;
		this.memberGrade = memberGrade;
	}


	


	public AdminMember(String memberId, String memberGrade) {
		this.memberId = memberId;
		this.memberGrade = memberGrade;
	}





	public String getMemberId() {
		return memberId;
	}





	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}





	public String getMemberPwd() {
		return memberPwd;
	}





	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}





	public String getMemberName() {
		return memberName;
	}





	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}





	public String getMemberEmail() {
		return memberEmail;
	}





	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}





	public String getMemberPhone() {
		return memberPhone;
	}





	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}





	public Date getMemberJoinDate() {
		return memberJoinDate;
	}





	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}





	public String getMemberOriginalPic() {
		return memberOriginalPic;
	}





	public void setMemberOriginalPic(String memberOriginalPic) {
		this.memberOriginalPic = memberOriginalPic;
	}





	public String getMemberRenamePic() {
		return memberRenamePic;
	}





	public void setMemberRenamePic(String memberRenamePic) {
		this.memberRenamePic = memberRenamePic;
	}





	public String getMemberBank() {
		return memberBank;
	}





	public void setMemberBank(String memberBank) {
		this.memberBank = memberBank;
	}





	public String getMemberLocPhone() {
		return memberLocPhone;
	}





	public void setMemberLocPhone(String memberLocPhone) {
		this.memberLocPhone = memberLocPhone;
	}





	public String getMemberAddress() {
		return memberAddress;
	}





	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}





	public String getMemberGrade() {
		return memberGrade;
	}





	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}





	@Override
	public String toString() {
		return "AdminMember [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberJoinDate=" + memberJoinDate
				+ ", memberOriginalPic=" + memberOriginalPic + ", memberRenamePic=" + memberRenamePic + ", memberBank="
				+ memberBank + ", memberLocPhone=" + memberLocPhone + ", memberAddress=" + memberAddress
				+ ", memberGrade=" + memberGrade + "]";
	}
    

}
