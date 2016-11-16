package com.model.afk.guide.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideFavorite;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.NotifyGItem;
import com.model.afk.guide.vo.StarPoint;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.vo.Payment;

@Repository("guideBoardDao")
public class GuideBoardDao {

	private static final String NAMESPACE = "guideMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuideItem> getGuideMain(int page, String code, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page);
		map.put("end", page + 5);
		map.put("code", code);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE + "getGuideMain", map);
	}
	
	public List<GuideFavorite> getAllFavorList() {
		return sqlSession.selectList(NAMESPACE + "getAllFavorList");
	}

	public List<GuideItem> getAllGuides(int page){
		
		return sqlSession.selectList(NAMESPACE + "getAllGuides", page);
	}
	
	public List<GuideFavorite> getGuideFavoriteList(String writer) {
		return sqlSession.selectList(NAMESPACE + "getGuideFavoriteList", writer);
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
	
	public int notifyItem(int itemNo, String user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("user", user);
		return sqlSession.insert(NAMESPACE + "notifyItem", map);
	}
	
	public List<NotifyGItem> getNotifiedList(int itemNo) {
		return sqlSession.selectList(NAMESPACE + "getNotifiedList", itemNo);
	}
	
	public List<GuideFavorite> getOneGuideFavoriteList(int itemNo) {
		return sqlSession.selectList(NAMESPACE + "getOneGuideFavoriteList", itemNo);
	}

	
	public int cancelNotifyItem(int itemNo, String user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("user", user);
		return sqlSession.delete(NAMESPACE + "cancelNotify", map);
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


	public List<GuideFavorite> getMyFavorList(String user) {
		return sqlSession.selectList(NAMESPACE + "getMyFavorList", user);
	}

	public List<GuideItem> getSearchedList(String keyword) {
		return sqlSession.selectList(NAMESPACE + "getSearchedList", keyword);
	}

	public int reviseStarPoint(StarPoint star) {
		return sqlSession.update(NAMESPACE + "reviseStarPoint", star);
	}


	


	





	

	

	
}
