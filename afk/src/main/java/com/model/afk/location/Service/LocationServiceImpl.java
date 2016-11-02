package com.company.sample.location.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.sample.location.dao.LocationDao;
import com.company.sample.location.vo.LocationCity;
import com.company.sample.location.vo.LocationCountry;

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
