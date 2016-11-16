package com.model.afk.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.matching.vo.Matching;
import com.model.afk.member.vo.Member;
import com.model.afk.mypage.dao.MypageDao;
import com.model.afk.myplanner.vo.MyPlanner;
import com.model.afk.payment.vo.Payment;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired 	MypageDao mpgDao;
	
	@Override
	public List<InfoBoardVO> selectmyFavorite(String mbid) {
		return mpgDao.selectmyFavorite(mbid);
	}
	
	@Override
	public int updateMyProfile(Member mvo) {
		return mpgDao.updateMyProfile(mvo);
	}

	@Override
	public List<GuideItem> selectmyWish(String mbid) {
		return mpgDao.selectmyWish(mbid);
	}

	@Override
	public int deleteMyProfile(Member mvo) {
		return mpgDao.deleteMyProfile(mvo);
	}

	@Override
	public int deleteMyWish(HashMap<String, Object> map) {
		return mpgDao.deleteMyWish(map);
	}

	@Override
	public List<GuideItem> selectmyGuide(String gid) {
		return mpgDao.selectmyGuide(gid);
	}

	@Override
	public List<Matching> selectmypay(String id) {
		return mpgDao.selectmyPay(id);
	}

	@Override
	public List<Matching> selectmyMatching(String id) {
		return mpgDao.selectmyMatching(id);
	}

	@Override
	public int deleteMyPay(HashMap<String, Object> map) {
		return mpgDao.deleteMyPay(map);
	}

	@Override
	public int deleteMyMatching(int matchingno) {
		return mpgDao.deleteMyMatching(matchingno);
	}

	@Override
	public List<InfoBoardVO> selectmyInfo(String id) {
		return mpgDao.selectmyInfo(id);
	}

}
