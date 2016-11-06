package com.model.afk.guide.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.dao.GuideBoardDao;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;

@Service("guideBoardService")
public class GuideBoardServiceImpl implements GuideBoardService{

	@Autowired
	private GuideBoardDao guideBoardDao;
	
	@Override
	public List<GuideItem> getGuideList(int page, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page);
		map.put("end", page + 7);
		map.put("code", code);
		return guideBoardDao.getGuideMain(map);
	}
	
	@Override
	public List<GuideItem> getAllGuides(int page) {
		return null ;
	}

	@Override
	public List<GuideItem> getAllItems(String writerNo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writerNo);
		map.put("start", page);
		map.put("end", page + 7);
		return guideBoardDao.getAllItems(map);
	}

	@Override
	public int insertItem(GuideItem gi) {
		return guideBoardDao.insertItem(gi);
	}

	@Override
	public int updateItem(GuideItem gi) {
		int result = 0;
		return result;
	}

	@Override
	public int deleteItem(int guideNo) {
		int result = 0;
		return result;
	}
	
	@Override
	public Member getGuideInfo(String writer) {
		return guideBoardDao.getGuideInfo(writer);
	}
	
	@Override
	public GuideItem getOneItem(int itemNo) {
		return guideBoardDao.getOneItem(itemNo);
	}
	
	@Override
	public int notifyItem(int itemNo) {
		return guideBoardDao.notifyItem(itemNo);
	}

	@Override
	public int addCount(int itemNo) {
		return guideBoardDao.addCount(itemNo);
	}
	
	
	@Override
	public int addFavoriteGI(String user, int itemNo) {	
		return guideBoardDao.addFavoriteGI(user, itemNo);
	}

	@Override
	public int removeFavoriteGI(String user, int itemNo) {
		return guideBoardDao.removeFavoriteGI(user, itemNo);
	}
	

	@Override
	public List<GuideItem> searchGuide(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GuideItem> searchItem(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Test> first() {
		return guideBoardDao.first();
	}

	@Override
	public int countTest() {
		return guideBoardDao.countTest();
	}

	@Override
	public List<Test> paging(int testNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", testNo);
		map.put("end", testNo + 4);
		return guideBoardDao.paging(map);
	}

	
	

}
