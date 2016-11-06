package com.model.afk.guide.service;

import java.util.List;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;

public interface GuideBoardService {
	
	public List<GuideItem> getGuideList(int page, String code);
	
	public List<GuideItem> getAllGuides(int page);
	
	public List<GuideItem> getAllItems(String writerNo, int page);
	
	public int insertItem(GuideItem gi);
	
	public int updateItem(GuideItem gi);
	
	public int deleteItem(int guideNo);
	
	public int addCount(int itemNo);
	
	public Member getGuideInfo(String writer);

	public GuideItem getOneItem(int itemNo);

	public int notifyItem(int itemNo);
	
	public int addFavoriteGI(String user, int itemNo);

	public int removeFavoriteGI(String user, int itemNo);

	
	
	
	public List<GuideItem> searchGuide(String keyword);
	
	public List<GuideItem> searchItem(String keyword);
	
	public List<Test> first();
	
	public int countTest();
	
	public List<Test> paging(int testNo);



	
	
}
