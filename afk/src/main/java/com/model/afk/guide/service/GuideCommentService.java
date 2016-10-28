package com.model.afk.guide.service;

import java.util.List;

import com.model.afk.guide.vo.GuideComment;

public interface GuideCommentService {
	
	public List<GuideComment> getAllComments(int guideNo);
	
	public int insertComment(GuideComment gc);
	
	public int updateComment(GuideComment gc);
	
	public int deleteComment(int cmNo);

}
