package com.model.afk.guide.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideItem;

@Repository
public class GuideBoardDao {

	private static final String NAMESPACE = "guideMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<GuideItem> getAllGuides(int page){
		
		return sqlSession.selectList(NAMESPACE + "getAllGuides", page);
	}
	
	public ArrayList<GuideItem> getAllItems(int page){
		
		return sqlSession.selectList(NAMESPACE + "getAllItems", page);
	}
	
	public int insertItem(GuideItem gi){
		
		return sqlSession.insert(NAMESPACE + "insertItem", gi);
	}
	
	public int updateItem(GuideItem gi){
		
		return sqlSession.update(NAMESPACE + "updateItem", gi);
	}
	
	public int deleteItem(int guideNo){
		
		return sqlSession.delete(NAMESPACE + "deleteItem", guideNo);
	}
	
	public int addCount(int guideNo){
		
		return sqlSession.update(NAMESPACE + "addCount", guideNo);
	}

}
