package com.model.afk.myplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.myplanner.dao.MyPlannerDao;
import com.model.afk.myplanner.vo.MyPlanner;

@Service
public class MyPlannerServiceImpl implements MyPlannerService {
	
	@Autowired MyPlannerDao dao;
	
	@Override
	public List<MyPlanner> connectMyPlanner() {
		return null;
	}

	@Override
	public MyPlanner selectMyPlanner() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMyPlanner() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMyPlanner() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMyPlanner() {
		// TODO Auto-generated method stub
		return 0;
	}

}
