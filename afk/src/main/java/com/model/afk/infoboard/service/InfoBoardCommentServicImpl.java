package com.model.afk.infoboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardCommentDao;
import com.model.afk.infoboard.vo.InfoCommentVO;

@Service
public class InfoBoardCommentServicImpl implements InfoBoardCommentService{
	@Autowired private InfoBoardCommentDao dao; 
	
	@Override
	public int insertBoardComment(InfoCommentVO vo) {
		return dao.insertBoardComment(vo);
	}

	@Override
	public int deleteBoardComment(int cno) {
		return dao.deleteBoardComment(cno);
	}

	@Override
	public List<InfoCommentVO> selectBoardComment(int bno) {
		return dao.selectBoardComment(bno);
	}
}
