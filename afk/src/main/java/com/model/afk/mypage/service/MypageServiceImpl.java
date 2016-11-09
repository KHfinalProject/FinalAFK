package com.model.afk.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
