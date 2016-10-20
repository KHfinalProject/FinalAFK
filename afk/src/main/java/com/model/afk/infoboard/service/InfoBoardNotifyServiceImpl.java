package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardNotifyDao;
import com.model.afk.infoboard.vo.InfoNotify;

@Service
public class InfoBoardNotifyServiceImpl implements InfoBoardNotifyService{
	
	@Autowired private InfoBoardNotifyDao dao;

	@Override
	public int insertBoardNotify(InfoNotify vo) {
		// TODO Auto-generated method stub
		return dao.insertBoardNotify(vo);
	}

}
