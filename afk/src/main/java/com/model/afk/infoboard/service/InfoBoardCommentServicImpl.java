package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardCommentDao;
import com.model.afk.infoboard.vo.InfoCommentVO;

@Service
public class InfoBoardCommentServicImpl implements InfoBoardCommentService{
	@Autowired private InfoBoardCommentDao dao; 
	
	@Override
	public int insertBoardComment(InfoCommentVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoardComment(vo);
	}

	@Override
	public int deleteBoardComment(int cno) {
		// TODO Auto-generated method stub
		return dao.deleteBoardComment(cno);
	}

	@Override
	public int updateBoardComment(InfoCommentVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoardComment(vo);
	}

}
