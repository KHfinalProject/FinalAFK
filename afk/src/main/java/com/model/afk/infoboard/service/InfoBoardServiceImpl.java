package com.model.afk.infoboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardDao;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.infoboard.vo.InfoNotifyVO;

@Service
public class InfoBoardServiceImpl implements InfoBoardService{
	@Autowired private InfoBoardDao dao;
	
	@Override
	public int insertBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int info_no) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(info_no); 
	}

	@Override
	public List<InfoBoardVO> getBoardList(int page) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", page);
		map.put("end", page + 9);
		return dao.getBoardList(map);
	}

	@Override
	public int updateBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}

	@Override
	public InfoBoardVO getBoardDetail(int info_no) {
		// TODO Auto-generated method stub
		return dao.getBoardDetail(info_no);
	}

	@Override
	public List<InfoBoardVO> getBoardSelectList(int page, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page);
		map.put("end", page + 9);
		map.put("code", code);
		return dao.getBoardSelectList(map);
	}
	
	// 디테일 페이지
	@Override
	public InfoBoardVO boardDetail(int info_no) {
		// TODO Auto-generated method stub
		return dao.boardDetail(info_no);
	}
	
	// 디테일 페이지 카운트
	@Override
	public int addCount(int info_no) {
		// TODO Auto-generated method stub
		return dao.addCount(info_no);
	}
	
	@Override
	public int notify(int info_no, String user) {
		// TODO Auto-generated method stub
		return dao.notify(info_no, user);
	}

	@Override
	public int notifyCencel(int info_no, String user) {
		// TODO Auto-generated method stub
		return dao.notifyCencel(info_no, user);
	}

	@Override
	public List<InfoNotifyVO> getNotifyList(int info_no) {
		// TODO Auto-generated method stub
		return dao.notifyList(info_no);
	}
	
	@Override
	public List<InfoBoardVO> infoSearch(String keyword) {
		// TODO Auto-generated method stub
		return dao.infoSearch(keyword);
	}



}
