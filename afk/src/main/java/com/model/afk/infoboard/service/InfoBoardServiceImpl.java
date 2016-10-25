package com.model.afk.infoboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardDao;
import com.model.afk.infoboard.vo.InfoBoardVO;

@Service
public class InfoBoardServiceImpl implements InfoBoardService{
	@Autowired private InfoBoardDao dao;
	
	@Override
	public int insertBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(bno); 
	}

	@Override
	public List<InfoBoardVO> getBoardList(int bno) {
		// TODO Auto-generated method stub
		return dao.getBoardList(bno);
	}

	@Override
	public int updateBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}

	@Override
	public InfoBoardVO getBoardDetail(int bno) {
		// TODO Auto-generated method stub
		return dao.getBoardDetail(bno);
	}

}
