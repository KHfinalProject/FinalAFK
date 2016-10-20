package com.model.afk.guide.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.model.afk.guide.vo.GuideItem;

@Service
public class GuideBoardServiceImpl implements GuideBoardService{

	@Autowired
	private GuideBoardDao gbd;
	
	@Override
	public ArrayList<GuideItem> getAllGuides(int page) {
		return ;
	}

	@Override
	public ArrayList<GuideItem> getAllItems(int page) {
		ArrayList<GuideItem> itemList = null;
		return itemList;
	}

	@Override
	public int insertItem(GuideItem gi) {
		int result = 0;
		return result;
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
	public int addCount(int guideNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<GuideItem> searchGuide(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<GuideItem> searchItem(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
