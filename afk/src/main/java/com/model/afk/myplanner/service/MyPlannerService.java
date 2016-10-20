package com.model.afk.myplanner.service;

import java.util.List;

import com.model.afk.myplanner.vo.MyPlanner;

public interface MyPlannerService {
	public List<MyPlanner> connectMyPlanner();
	
	public MyPlanner selectMyPlanner();
	
	public int insertMyPlanner();
	
	public int deleteMyPlanner();
	
	public int updateMyPlanner();
}
