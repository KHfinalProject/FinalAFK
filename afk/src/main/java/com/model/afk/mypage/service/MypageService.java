package com.model.afk.mypage.service;

import java.util.List;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.vo.Member;
import com.model.afk.myplanner.vo.MyPlanner;

public interface MypageService {
	
	List<InfoBoardVO> selectmyFavorite(String mbid);

	List<MyPlanner> selectmyPlan(String mbid);

	int updateMyProfile(Member mvo);

	List<GuideItem> selectmyWish(String mbid);

	int deleteMyProfile(Member mvo);
}
