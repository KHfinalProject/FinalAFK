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
	
	public int insertComment(String writer, int itemNo, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("itemNo", itemNo);
		map.put("content", content);
		return sqlSession.insert(NAMESPACE + "insertComment", map);
	}
	
	public int updateComment(int cmNo, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cmNo", cmNo);
		map.put("content", content);
		return sqlSession.update(NAMESPACE + "updateComment", map);
	}

	public int deleteComment(int cmNo){		
		return sqlSession.delete(NAMESPACE + "deleteComment", cmNo);
	}

	public List<GuideComment> getCommentList(int itemNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "getCommentList", itemNo);
	}

	

}
