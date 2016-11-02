package com.company.sample.location.vo;

public class LocationCountry implements java.io.Serializable{
	private String area_no;			//대륙코드
	private String country_no;		//국가코드
	private String country_name;	//국가명
	
	public LocationCountry(){}

	public LocationCountry(String area_no, String country_no, String country_name) {
		super();
		this.area_no = area_no;
		this.country_no = country_no;
		this.country_name = country_name;
	}

	public String getArea_no() {
		return area_no;
	}

	public void setArea_no(String area_no) {
		this.area_no = area_no;
	}

	public String getCountry_no() {
		return country_no;
	}

	public void setCountry_no(String country_no) {
		this.country_no = country_no;
	}

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}

	@Override
	public String toString() {
		return "LocationCountry [area_no=" + area_no + ", country_no=" + country_no + ", country_name=" + country_name
				+ "]";
	}
	
	
}
