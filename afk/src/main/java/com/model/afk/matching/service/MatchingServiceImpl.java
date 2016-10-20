package com.model.afk.matching.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.model.afk.matching.dao.MatchingDao;

@Service
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired MatchingDao mdao;

	@Override
	public Model matAllList() {
		// TODO Auto-generated method stub
		return null;
	}

}
