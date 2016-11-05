package com.model.afk.guide.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideComment;

@Repository("guideCommentDao")
public class GuideCommentDao {

	private static final String NAMESPACE = "guideCommentMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuideComment> getAllComments(int itemNo, int page){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", page);
		map.put("end", page + 4);
		map.put("itemNo", itemNo);
		return sqlSession.selectList(NAMESPACE + "getAllComments", map);
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
