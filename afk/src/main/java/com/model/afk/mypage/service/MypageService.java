package com.model.afk.mypage.service;

import com.model.afk.member.vo.Member;

public interface MypageService {
	//List<GuideBoardVO>getMyWishList(Map<String, Object> map)
	//List<InfoBoardVO> getMyFavoriteList(Map<String, Object> map)
	//List<BoardVO>getMyReviewList(Map<String, Object> map)
	Member updateMyProfile(Member mvo);
}
