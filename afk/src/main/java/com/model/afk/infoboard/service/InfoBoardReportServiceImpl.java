package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardReportDao;
import com.model.afk.infoboard.vo.InfoReportVO;

@Service
public class InfoBoardReportServiceImpl implements InfoBoardReportService{
	@Autowired private InfoBoardReportDao dao;
	
	@Override
	public int insertBoardReport(InfoReportVO vo) { 
		return dao.insertBoardReport(vo);
	}

	@Override
	public InfoReportVO selectBoardReport(InfoReportVO vo) {
		return dao.selectBoardReport(vo);
	}

	@Override
	public int deleteBoardReport(int no) {
		return dao.deleteBoardReport(no);
	}

}
