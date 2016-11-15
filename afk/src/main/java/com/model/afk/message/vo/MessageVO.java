package com.model.afk.message.vo;

import java.util.Date;

@SuppressWarnings("serial")
public class MessageVO implements java.io.Serializable{

	private int mes_no;	//메세지 고유번호
	private String send_id;	//메세지 보낸사람 ID
	private String recieve_id;	//메세지 받는사람 ID
	private char view_yn;	//메세지 열람여부
	private Date send_date;	//메세지 보낸날짜
	private Date view_date;	//메세지 본 날짜
	private String mes_content;	//메세지 내용
	private int parent_msgno;	//부모 메세지 번호
	private char s_delyn;		//보낸사람 삭제여부
	private char r_delyn;		//받는사람 삭제여부
	private String mb_rename_pic;
	
	public MessageVO() {
		super();
	}

	public MessageVO(int mes_no, String send_id, String recieve_id, char view_yn, Date send_date, Date view_date,
			String mes_content, int parent_msgno, char s_delyn, char r_delyn, String mb_rename_pic) {
		super();
		this.mes_no = mes_no;
		this.send_id = send_id;
		this.recieve_id = recieve_id;
		this.view_yn = view_yn;
		this.send_date = send_date;
		this.view_date = view_date;
		this.mes_content = mes_content;
		this.parent_msgno = parent_msgno;
		this.s_delyn = s_delyn;
		this.r_delyn = r_delyn;
		this.mb_rename_pic = mb_rename_pic;
	}

	public MessageVO(String send_id, String recieve_id) {
		this.send_id = send_id;
		this.recieve_id = recieve_id;
	}

	public int getMes_no() {
		return mes_no;
	}

	public void setMes_no(int mes_no) {
		this.mes_no = mes_no;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getRecieve_id() {
		return recieve_id;
	}

	public void setRecieve_id(String recieve_id) {
		this.recieve_id = recieve_id;
	}

	public char getView_yn() {
		return view_yn;
	}

	public void setView_yn(char view_yn) {
		this.view_yn = view_yn;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public Date getView_date() {
		return view_date;
	}

	public void setView_date(Date view_date) {
		this.view_date = view_date;
	}

	public String getMes_content() {
		return mes_content;
	}

	public void setMes_content(String mes_content) {
		this.mes_content = mes_content;
	}

	public int getParent_msgno() {
		return parent_msgno;
	}

	public void setParent_msgno(int parent_msgno) {
		this.parent_msgno = parent_msgno;
	}

	public char getS_delyn() {
		return s_delyn;
	}

	public void setS_delyn(char s_delyn) {
		this.s_delyn = s_delyn;
	}

	public char getR_delyn() {
		return r_delyn;
	}

	public void setR_delyn(char r_delyn) {
		this.r_delyn = r_delyn;
	}
	
	public String getMb_rename_pic() {
		return mb_rename_pic;
	}

	public void setMb_rename_pic(String mb_rename_pic) {
		this.mb_rename_pic = mb_rename_pic;
	}

	@Override
	public String toString() {
		return "MessageVO [mes_no=" + mes_no + ", send_id=" + send_id + ", recieve_id=" + recieve_id + ", view_yn="
				+ view_yn + ", send_date=" + send_date + ", view_date=" + view_date + ", mes_content=" + mes_content
				+ ", parent_msgno=" + parent_msgno + ", s_delyn=" + s_delyn + ", r_delyn=" + r_delyn
				+ ", mb_rename_pic=" + mb_rename_pic + "]";
	}
	
}
