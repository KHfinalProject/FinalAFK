package com.company.sample.location.Service;

import java.util.List;

import com.company.sample.location.vo.LocationCity;
import com.company.sample.location.vo.LocationCountry;

public interface LocationService {

	List<LocationCountry> loadCountry(String code);

	List<LocationCity> loadCity(String code);

}
