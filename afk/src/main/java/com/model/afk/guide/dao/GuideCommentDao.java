package com.model.afk.guide.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideComment;

@Repository("guideCommentDao")
public class GuideCommentDao {

	private static final String NAMESPACE = "guideCommentMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuideComment> getAllComments(int guideNo){
		
		return sqlSession.selectList(NAMESPACE + "getAllComments", guideNo);
	}
	
	public int insertComment(GuideComment gc){
		
		return sqlSession.insert(NAMESPACE + "insertComment", gc);
	}
	
	public int updateComment(GuideComment gc){
		
		return sqlSession.update(NAMESPACE + "updateComment", gc);
	}
	
	public int deleteComment(int cmNo){
		
		return sqlSession.delete(NAMESPACE + "deleteComment", cmNo);
	}
}
