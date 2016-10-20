package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardPointDao;
import com.model.afk.infoboard.vo.InfoPoint;

@Service
public class InfoBoardPointServiceImpl implements InfoBoardPointService{
	@Autowired private InfoBoardPointDao dao;
	
	@Override
	public int insertBoardPoint(InfoPoint vo) {
		// TODO Auto-generated method stub
		return dao.insertBoardPoint(vo);
	}

}
