package com.model.afk.myplanner.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.afk.myplanner.service.MyPlannerService;
import com.model.afk.myplanner.vo.MyPlanner;

@Controller
public class MyPlannerController {

	@Autowired MyPlannerService myplan;
	
	//@RequestMapping("")
	public String connectMyPlanner(Model model, HttpSession session){
		List<MyPlanner> list = myplan.connectMyPlanner();
		//마이플래너 리스트 불러와서 마이플래너 페이지로 이동
		return null;
	}
	
	//@RequestMapping("")
	public String selectMyPlanner(){
		MyPlanner my = myplan.selectMyPlanner();
		//마이플래너 객체 불러와서 마이플래너 상세보기 페이지로 이동
		return null;
	}
	
	//@RequestMapping("")
	public String insertMyPlanner(){
		int result = myplan.insertMyPlanner();
		//마이 플래너 저장하기
		return null;
	}
	
	//@RequestMapping("")
	public String deleteMyPlanner(){
		int result = myplan.deleteMyPlanner();
		//마이플래너 삭제하기
		return null;
	}
	
	//@RequestMapping("")
	public String updateMyPlanner(){
		int result = myplan.updateMyPlanner();
		//마이플래너 수정하기
		return null;
	}

}
