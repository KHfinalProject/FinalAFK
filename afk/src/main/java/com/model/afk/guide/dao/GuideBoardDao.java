package com.model.afk.guide.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.StarPoint;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;

@Repository("guideBoardDao")
public class GuideBoardDao {

	private static final String NAMESPACE = "guideMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuideItem> getGuideMain(int page, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page);
		map.put("end", page + 7);
		map.put("code", code);
		return sqlSession.selectList(NAMESPACE + "getGuideMain", map);
	}

	public List<GuideItem> getAllGuides(int page){
		
		return sqlSession.selectList(NAMESPACE + "getAllGuides", page);
	}
	
	public Member getGuideInfo(String writer) {
		return sqlSession.selectOne(NAMESPACE + "getGuideInfo", writer);
	}
	
	public List<GuideItem> getAllItems(String writerNo, int page, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writerNo);
		map.put("start", page);
		map.put("end", page + 3);
		map.put("code", code);
		return sqlSession.selectList(NAMESPACE + "getAllItems", map);
	}
	
	public int getTotalCount(String writer) {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", writer);
	}
	
	public GuideItem getOneItem(int itemNo) {
		return sqlSession.selectOne(NAMESPACE + "getOneItem", itemNo);
	}
	
	public List<StarPoint> getPointList(int itemNo) {
		return sqlSession.selectList(NAMESPACE + "getPointList", itemNo);
	}
	
	public int addCount(int itemNo){	
		return sqlSession.update(NAMESPACE + "addCount", itemNo);
	}
	
	public int notifyItem(int itemNo) {
		return sqlSession.update(NAMESPACE + "notifyItem", itemNo);
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
	
	public int addFavoriteGI(String user, int itemNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("item", itemNo);
		return sqlSession.update(NAMESPACE + "addFavorite", map);
	}

	public int removeFavoriteGI(String user, int itemNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("item", itemNo);
		return sqlSession.insert(NAMESPACE + "removeFavorite", map);
	}
	
	public int giveStarPoint(String writer, int itemNo, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("itemNo", itemNo);
		map.put("point", point);
		return sqlSession.insert(NAMESPACE + "giveStarPoint", map);
	}



	
	public List<Test> first(){
		return sqlSession.selectList(NAMESPACE + "test");
	}
	
	public int countTest(){
		return sqlSession.selectOne(NAMESPACE + "countBoard");
	}
	
	
	public List<Test> paging(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "paging", map);
	}


	

	

	
}
