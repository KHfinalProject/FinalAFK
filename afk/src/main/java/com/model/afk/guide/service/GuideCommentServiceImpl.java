package com.model.afk.guide.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.dao.GuideCommentDao;
import com.model.afk.guide.vo.GuideComment;

@Service("guideCommentService")
public class GuideCommentServiceImpl implements GuideCommentService {

	@Autowired
	private GuideCommentDao guideCommentDao;
	
	@Override
	public List<GuideComment> getAllComments(int guideNo, int page) {	
		return guideCommentDao.getAllComments(guideNo, page);
	}

	@Override
	public int insertComment(String writer, int itemNo, String content) {
		return guideCommentDao.insertComment(writer, itemNo, content);
	}


	@Override
	public int updateComment(int cmNo, String content) {
		return guideCommentDao.updateComment(cmNo, content);
	}

	@Override
	public int deleteComment(int cmNo) {
		return guideCommentDao.deleteComment(cmNo);
	}

	@Override
	public List<GuideComment> getCommentList(int itemNo) {
		// TODO Auto-generated method stub
		return guideCommentDao.getCommentList(itemNo);
	}



	


}
