package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardReportDao;
import com.model.afk.infoboard.vo.InfoReport;

@Service
public class InfoBoardReportServiceImpl implements InfoBoardReportService{
	@Autowired private InfoBoardReportDao dao;
	
	@Override
	public int insertBoardReport(InfoReport vo) {
		// TODO Auto-generated method stub
		return dao.insertBoardReport(vo);
	}

}
