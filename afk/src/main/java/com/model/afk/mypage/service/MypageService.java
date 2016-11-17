package com.model.afk.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.matching.vo.Matching;
import com.model.afk.member.vo.Member;
import com.model.afk.myplanner.vo.MyPlanner;
import com.model.afk.payment.vo.Payment;

public interface MypageService {
	
	List<InfoBoardVO> selectmyFavorite(String mbid);

	int updateMyProfile(Member mvo);

	List<GuideItem> selectmyWish(String mbid);

	int deleteMyProfile(Member mvo);

	int deleteMyWish(HashMap<String, Object> map);

	List<GuideItem> selectmyGuide(String gid);

	List<Matching> selectmypay(String id);

	List<Matching> selectmyMatching(String id);

	int deleteMyPay(HashMap<String, Object> map);

	int deleteMyMatching(int matchingno);

	List<InfoBoardVO> selectmyInfo(String id);

	int deleteMyFavorite(HashMap<String, Object> map);
}
