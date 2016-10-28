package com.model.afk.guide.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.dao.GuideCommentDao;
import com.model.afk.guide.vo.GuideComment;

@Service("guideCommentService")
public class GuideCommentServiceImpl implements GuideCommentService {

	@Autowired
	private GuideCommentDao gcd;
	
	@Override
	public List<GuideComment> getAllComments(int guideNo) {	
		return gcd.getAllComments(guideNo);
	}

	@Override
	public int insertComment(GuideComment gc) {
		return gcd.insertComment(gc);
	}

	@Override
	public int updateComment(GuideComment gc) {
		return gcd.updateComment(gc);
	}

	@Override
	public int deleteComment(int cmNo) {
		return gcd.deleteComment(cmNo);
	}


}
