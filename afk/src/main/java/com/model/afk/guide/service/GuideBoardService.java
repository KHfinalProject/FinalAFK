package com.model.afk.guide.service;

import java.util.List;

import com.model.afk.guide.vo.GuideFavorite;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.NotifyGItem;
import com.model.afk.guide.vo.StarPoint;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.vo.Payment;

public interface GuideBoardService {
	
	public List<GuideItem> getGuideList(int page, String code, String keyword);
	
	public List<GuideFavorite> getAllFavorList();
	
	public List<GuideItem> getAllGuides(int page);
	
	public List<GuideFavorite> getGuideFavoriteList(String writer);
	
	public List<GuideItem> getAllItems(String writerNo, int page, String code);
	
	public int insertItem(GuideItem gi);
	
	public int updateItem(GuideItem gi);
	
	public int deleteItem(int guideNo);
	
	public int addCount(int itemNo);
	
	public Member getGuideInfo(String writer);

	public GuideItem getOneItem(int itemNo);

	public List<StarPoint> getPointList(int itemNo);
	
	public List<NotifyGItem> getNotifiedList(int itemNo);
	
	public List<GuideFavorite> getOneGuideFavoriteList(int itemNo);

	public int notifyItem(int itemNo, String user);
	
	public int cancelNotifyItem(int itemNo, String user);
	
	public int addFavoriteGI(String user, int itemNo);

	public int removeFavoriteGI(String user, int itemNo);

	public int giveStarPoint(String writer, int itemNo, int point);
	
	
	
	public List<GuideItem> searchGuide(String keyword);
	
	public List<GuideItem> searchItem(String keyword);
	
	public List<Test> first();
	
	public int countTest();
	
	public List<Test> paging(int testNo);

	public int getTotalCount(String writer);



	public List<GuideFavorite> getMyFavorList(String user);

	public List<GuideItem> getSearchedList(String keyword);

	public int reviseStarPoint(StarPoint star);


	

	



	

	




	
	
}
