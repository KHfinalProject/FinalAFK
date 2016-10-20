package com.model.afk.guide.service;

import java.util.ArrayList;

import com.model.afk.guide.vo.GuideComment;

public interface GuideCommentService {
	
	public ArrayList<GuideComment> getAllComments(int guideNo);
	
	public int insertComment(GuideComment gc);
	
	public int updateComment(GuideComment gc);
	
	public int deleteComment(int cmNo);

}
