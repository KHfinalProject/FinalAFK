package com.model.afk.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.vo.Member;
import com.model.afk.myplanner.vo.MyPlanner;

public interface MypageService {
	//List<GuideBoardVO>getMyWishList(Map<String, Object> map)
	//List<InfoBoardVO> getMyFavoriteList(Map<String, Object> map)
	//List<BoardVO>getMyReviewList(Map<String, Object> map)
	
	List<InfoBoardVO> selectmyFavorite(String mbid);

	List<MyPlanner> selectmyPlan(String mbid);

	int updateMyProfile(Member mvo);
}
