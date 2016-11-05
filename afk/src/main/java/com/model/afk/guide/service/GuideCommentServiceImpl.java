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
	public int insertComment(GuideComment gc) {
		return guideCommentDao.insertComment(gc);
	}

	@Override
	public int updateComment(GuideComment gc) {
		return guideCommentDao.updateComment(gc);
	}

	@Override
	public int deleteComment(int cmNo) {
		return guideCommentDao.deleteComment(cmNo);
	}



}
