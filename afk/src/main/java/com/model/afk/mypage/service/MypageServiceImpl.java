package com.model.afk.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.member.vo.Member;
import com.model.afk.mypage.dao.MypageDao;
import com.model.afk.myplanner.dao.MyPlannerDao;
import com.model.afk.reviewboard.dao.ReviewDao;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired 	MypageDao mpgDao;
	@Autowired 	MyPlannerDao mplDao;
	//@Autowired 	//가이드 dao
	@Autowired 	ReviewDao rDao;
	//@Autowired	InfoBoardDao bDao;
	//@Autowired 	MemberDao mDao;
	
	@Override
	public Member updateMyProfile(Member mvo) {
		// TODO Auto-generated method stub
		return null;
	}

}
