package com.model.afk.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.vo.Member;
import com.model.afk.mypage.dao.MypageDao;
import com.model.afk.myplanner.vo.MyPlanner;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired 	MypageDao mpgDao;
	
	@Override
	public List<InfoBoardVO> selectmyFavorite(String mbid) {
		return mpgDao.selectmyFavorite(mbid);
	}

	@Override
	public List<MyPlanner> selectmyPlan(String mbid) {
		return mpgDao.selectmyPlan(mbid);
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

}
