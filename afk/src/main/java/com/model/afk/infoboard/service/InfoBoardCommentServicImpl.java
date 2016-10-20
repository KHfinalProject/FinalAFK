package com.model.afk.infoboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.infoboard.dao.InfoBoardCommentDao;
import com.model.afk.infoboard.vo.InfoComment;

@Service
public class InfoBoardCommentServicImpl implements InfoBoardCommentService{
	@Autowired private InfoBoardCommentDao dao; 
	
	@Override
	public int insertBoardComment(InfoComment vo) {
		// TODO Auto-generated method stub
		return dao.insertBoardComment(vo);
	}

	@Override
	public int deleteBoardComment(int cno) {
		// TODO Auto-generated method stub
		return dao.deleteBoardComment(cno);
	}

	@Override
	public int updateBoardComment(InfoComment vo) {
		// TODO Auto-generated method stub
		return dao.updateBoardComment(vo);
	}

}
