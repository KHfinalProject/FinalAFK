package com.model.afk.location.Service;

import java.util.List;
import java.util.Map;

import com.model.afk.location.vo.LocationCity;
import com.model.afk.location.vo.LocationCountry;

public interface LocationService {

	List<LocationCountry> loadCountry(String code);

	List<LocationCity> loadCity(String code);

	Map<String,String> city(String code);

}
