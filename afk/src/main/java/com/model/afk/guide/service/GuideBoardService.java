package com.model.afk.guide.service;

import java.util.List;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.Test;

public interface GuideBoardService {
	
	public List<GuideItem> getAllGuides(int page);
	
	public List<GuideItem> getAllItems(int page);
	
	public int insertItem(GuideItem gi);
	
	public int updateItem(GuideItem gi);
	
	public int deleteItem(int guideNo);
	
	public int addCount(int guideNo);
	
	public List<GuideItem> searchGuide(String keyword);
	
	public List<GuideItem> searchItem(String keyword);
	
	public List<Test> first();
	
	public int countTest();
	
	
}
