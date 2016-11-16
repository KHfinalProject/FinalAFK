package com.model.afk.location.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.location.vo.LocationCity;
import com.model.afk.location.vo.LocationCountry;

@Repository
public class LocationDao {
	private final static String NAMESPACE = "locationMapper.";
	
	@Autowired private SqlSession sql;
	
	public List<LocationCountry> loadCountry(String code) {
		
		return sql.selectList(NAMESPACE + "getCountryList", code);
	}

	public List<LocationCity> loadCity(String code) {
		
		return sql.selectList(NAMESPACE + "getCityList", code);
	}

	public Map<String,String> city(String code) {
		
		return sql.selectOne(NAMESPACE + "getCity", code);
	}

}
