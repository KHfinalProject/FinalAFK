package com.model.afk.message.vo;

import java.util.Date;

@SuppressWarnings("serial")
public class MessageVO implements java.io.Serializable{
	
	private int mesNo;	//메세지 고유번호
	private String sendId;	//메세지 보낸사람 ID
	private String recieveId;	//메세지 받는사람 ID
	private char viewYN;	//메세지 열람여부
	private Date sendDate;	//메세지 보낸날짜
	private Date ViewDate;	//메세지 본 날짜
	private String mesContent;	//메세지 내용
	private int parentMsgno;	//부모 메세지 번호
	private char sDelYN;		//보낸사람 삭제여부
	private char rDelYN;		//받는사람 삭제여부
	
	public MessageVO() {
		super();
	}

	public MessageVO(int mesNo, String sendId, String recieveId, char viewYN, Date sendDate, Date viewDate,
			String mesContent, int parentMsgno, char sDelYN, char rDelYN) {
		super();
		this.mesNo = mesNo;
		this.sendId = sendId;
		this.recieveId = recieveId;
		this.viewYN = viewYN;
		this.sendDate = sendDate;
		ViewDate = viewDate;
		this.mesContent = mesContent;
		this.parentMsgno = parentMsgno;
		this.sDelYN = sDelYN;
		this.rDelYN = rDelYN;
	}

	public int getMesNo() {
		return mesNo;
	}

	public void setMesNo(int mesNo) {
		this.mesNo = mesNo;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getRecieveId() {
		return recieveId;
	}

	public void setRecieveId(String recieveId) {
		this.recieveId = recieveId;
	}

	public char getViewYN() {
		return viewYN;
	}

	public void setViewYN(char viewYN) {
		this.viewYN = viewYN;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Date getViewDate() {
		return ViewDate;
	}

	public void setViewDate(Date viewDate) {
		ViewDate = viewDate;
	}

	public String getMesContent() {
		return mesContent;
	}

	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}

	public int getParentMsgno() {
		return parentMsgno;
	}

	public void setParentMsgno(int parentMsgno) {
		this.parentMsgno = parentMsgno;
	}

	public char getsDelYN() {
		return sDelYN;
	}

	public void setsDelYN(char sDelYN) {
		this.sDelYN = sDelYN;
	}

	public char getrDelYN() {
		return rDelYN;
	}

	public void setrDelYN(char rDelYN) {
		this.rDelYN = rDelYN;
	}

	@Override
	public String toString() {
		return "MessageVO [mesNo=" + mesNo + ", sendId=" + sendId + ", recieveId=" + recieveId + ", viewYN=" + viewYN
				+ ", sendDate=" + sendDate + ", ViewDate=" + ViewDate + ", mesContent=" + mesContent + ", parentMsgno="
				+ parentMsgno + ", sDelYN=" + sDelYN + ", rDelYN=" + rDelYN + "]";
	}
	
	
}
