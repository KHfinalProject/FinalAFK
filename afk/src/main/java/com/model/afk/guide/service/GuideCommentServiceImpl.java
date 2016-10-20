package com.model.afk.guide.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.dao.GuideCommentDao;
import com.model.afk.guide.vo.GuideComment;

@Service
public class GuideCommentServiceImpl implements GuideCommentService {

	@Autowired
	private GuideCommentDao gcd;
	
	@Override
	public ArrayList<GuideComment> getAllComments(int guideNo) {	
		return gcd.getAllComments();
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
