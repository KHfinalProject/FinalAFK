package com.model.afk.guide.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.Test;

@Repository("guideBoardDao")
public class GuideBoardDao {

	private static final String NAMESPACE = "guideMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Test> first(){
		return sqlSession.selectList(NAMESPACE + "test");
	}
	
	public int countTest(){
		return sqlSession.selectOne(NAMESPACE + "countBoard");
	}
	
	public List<GuideItem> getAllGuides(int page){
		
		return sqlSession.selectList(NAMESPACE + "getAllGuides", page);
	}
	
	public List<GuideItem> getAllItems(int page){
		
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

	public List<Test> paging(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "paging", map);
	}

}
