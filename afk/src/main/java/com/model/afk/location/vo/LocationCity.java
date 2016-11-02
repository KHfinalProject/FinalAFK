package com.company.sample.location.vo;

public class LocationCity implements java.io.Serializable {
	private String country_no;			//국가 코드
	private String city_no;				//도시 코드
	private String city_name; 			//도시명
	
	public LocationCity(){}

	public LocationCity(String country_no, String city_no, String city_name) {
		super();
		this.country_no = country_no;
		this.city_no = city_no;
		this.city_name = city_name;
	}

	public String getCountry_no() {
		return country_no;
	}

	public void setCountry_no(String country_no) {
		this.country_no = country_no;
	}

	public String getCity_no() {
		return city_no;
	}

	public void setCity_no(String city_no) {
		this.city_no = city_no;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	@Override
	public String toString() {
		return "LocationCity [country_no=" + country_no + ", city_no=" + city_no + ", city_name=" + city_name + "]";
	}
	
	
}
