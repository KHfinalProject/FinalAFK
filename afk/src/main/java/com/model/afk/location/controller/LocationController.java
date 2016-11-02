package com.company.sample.location.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.sample.location.Service.LocationService;
import com.company.sample.location.vo.LocationCity;
import com.company.sample.location.vo.LocationCountry;

@Controller
public class LocationController {
	
	@Autowired private LocationService locs;
	
	//지역코드를 이용해 국가의 리스트를 뽑아오는 메소드
	@RequestMapping(value="/location/loadCounrty", method= RequestMethod.POST)
	public void loadCountry(@RequestParam("code") String code, HttpServletResponse response) throws IOException{
		
		List<LocationCountry> list = locs.loadCountry(code);
		
		//전송할 최종 json 객체
		JSONObject json = new JSONObject();

		json.put("list", list);                
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString()); 
	}
	
	//국가코드를 이용해 도시의 리스트를 뽑아오는 메소드
	@RequestMapping(value="/location/loadCity", method= RequestMethod.POST)
	public void loadCity(@RequestParam("code") String code, HttpServletResponse response) throws IOException{
		
		List<LocationCity> list = locs.loadCity(code);
		
		//전송할 최종 json 객체
		JSONObject json = new JSONObject();

		json.put("list", list);                
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString()); 
	}
}
