package com.model.afk.location.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.afk.location.Service.LocationService;
import com.model.afk.location.vo.LocationCity;
import com.model.afk.location.vo.LocationCountry;

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
	
	//도시코드를 이용해 특정도시의 정보를 뽑아오는 메소드
	@RequestMapping("/location/city")
	public @ResponseBody Map<String,String> city(@RequestParam("loc") String code){
		System.out.println(code);
		Map<String,String> map = locs.city(code);
		
		System.out.println(map);
		
		return map;
	}
}
