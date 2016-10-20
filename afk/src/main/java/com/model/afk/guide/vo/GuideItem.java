package com.model.afk.guide.vo;

import java.sql.Date;

public class GuideItem implements java.io.Serializable {

	//Field
	private int guideNo; //가이드 글번호
	private String guideTitle; //가이드 글 제목
	private String guideContent; //가이드 글 내용
	private String guideWriter; //가이드 글 작성자 ID
	private Date enrolldate; //가이드 글 등록일
	private String guideLocL; //지역분류 대
	private String guideLocM; //지역분류 중
	private String guideLocS; //지역분류 소
	private int guideCount; //조회수
	private int guidePoint; //별점
	private int guideNotify; //신고횟수
	private int guidePrice; //상품가격
	private String guideMap; //지도 정보
	
	//Constructor
	public GuideItem(){}
	
	public GuideItem(int guideNo, String guideTitle, String guideContent, String guideWriter, Date enrolldate,
			String guideLocL, String guideLocM, String guideLocS, int guideCount, int guidePoint, int guideNotify,
			int guidePrice, String guideMap) {
		super();
		this.guideNo = guideNo;
		this.guideTitle = guideTitle;
		this.guideContent = guideContent;
		this.guideWriter = guideWriter;
		this.enrolldate = enrolldate;
		this.guideLocL = guideLocL;
		this.guideLocM = guideLocM;
		this.guideLocS = guideLocS;
		this.guideCount = guideCount;
		this.guidePoint = guidePoint;
		this.guideNotify = guideNotify;
		this.guidePrice = guidePrice;
		this.guideMap = guideMap;
	}

	//Getter & Setter
	public int getGuideNo() {
		return guideNo;
	}

	public void setGuideNo(int guideNo) {
		this.guideNo = guideNo;
	}

	public String getGuideTitle() {
		return guideTitle;
	}

	public void setGuideTitle(String guideTitle) {
		this.guideTitle = guideTitle;
	}

	public String getGuideContent() {
		return guideContent;
	}

	public void setGuideContent(String guideContent) {
		this.guideContent = guideContent;
	}

	public String getGuideWriter() {
		return guideWriter;
	}

	public void setGuideWriter(String guideWriter) {
		this.guideWriter = guideWriter;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getGuideLocL() {
		return guideLocL;
	}

	public void setGuideLocL(String guideLocL) {
		this.guideLocL = guideLocL;
	}

	public String getGuideLocM() {
		return guideLocM;
	}

	public void setGuideLocM(String guideLocM) {
		this.guideLocM = guideLocM;
	}

	public String getGuideLocS() {
		return guideLocS;
	}

	public void setGuideLocS(String guideLocS) {
		this.guideLocS = guideLocS;
	}

	public int getGuideCount() {
		return guideCount;
	}

	public void setGuideCount(int guideCount) {
		this.guideCount = guideCount;
	}

	public int getGuidePoint() {
		return guidePoint;
	}

	public void setGuidePoint(int guidePoint) {
		this.guidePoint = guidePoint;
	}

	public int getGuideNotify() {
		return guideNotify;
	}

	public void setGuideNotify(int guideNotify) {
		this.guideNotify = guideNotify;
	}

	public int getGuidePrice() {
		return guidePrice;
	}

	public void setGuidePrice(int guidePrice) {
		this.guidePrice = guidePrice;
	}

	public String getGuideMap() {
		return guideMap;
	}

	public void setGuideMap(String guideMap) {
		this.guideMap = guideMap;
	}

	@Override
	public String toString() {
		return "GuideItem [guideNo=" + guideNo + ", guideTitle=" + guideTitle + ", guideContent=" + guideContent
				+ ", guideWriter=" + guideWriter + ", enrolldate=" + enrolldate + ", guideLocL=" + guideLocL
				+ ", guideLocM=" + guideLocM + ", guideLocS=" + guideLocS + ", guideCount=" + guideCount
				+ ", guidePoint=" + guidePoint + ", guideNotify=" + guideNotify + ", guidePrice=" + guidePrice
				+ ", guideMap=" + guideMap + "]";
	}
	
	
}
