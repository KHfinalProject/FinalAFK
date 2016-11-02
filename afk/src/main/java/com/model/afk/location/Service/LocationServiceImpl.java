package com.model.afk.location.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.location.dao.LocationDao;
import com.model.afk.location.vo.LocationCity;
import com.model.afk.location.vo.LocationCountry;

@Service
public class LocationServiceImpl implements LocationService {
	
	@Autowired private LocationDao dao;
	
	@Override
	public List<LocationCountry> loadCountry(String code) {
		return dao.loadCountry(code);
	}

	@Override
	public List<LocationCity> loadCity(String code) {
		
		return dao.loadCity(code);
	}

}
