package com.model.afk.guide.service;

import java.util.ArrayList;

import com.model.afk.guide.vo.GuideItem;

public interface GuideBoardService {
	
	public ArrayList<GuideItem> getAllGuides(int page);
	
	public ArrayList<GuideItem> getAllItems(int page);
	
	public int insertItem(GuideItem gi);
	
	public int updateItem(GuideItem gi);
	
	public int deleteItem(int guideNo);
	
	public int addCount(int guideNo);
	
	public ArrayList<GuideItem> searchGuide(String keyword);
	
	public ArrayList<GuideItem> searchItem(String keyword);
	
	
}
