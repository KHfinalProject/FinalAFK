package com.model.afk.guide.service;

import java.util.List;

import com.model.afk.guide.vo.GuideComment;

public interface GuideCommentService {
	
	public List<GuideComment> getAllComments(int guideNo, int page);
	
	public int insertComment(String writer, int itemNo, String content);
	
	public int updateComment(int cmNo, String content);
	
	public int deleteComment(int cmNo);

	public List<GuideComment> getCommentList(int itemNo);

	

	

}
