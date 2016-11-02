package com.model.afk.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.vo.Member;
import com.model.afk.myplanner.vo.MyPlanner;

@Repository
public class MypageDao {
	
	private static final String NAMESPACE = "mypageMapper.";
	
	@Autowired 	
	private SqlSession sqlSession;
	
	public List<InfoBoardVO> selectmyFavorite(String mbid) {
		return sqlSession.selectList(NAMESPACE + "selectmyFavorite", mbid);
	}

	public List<MyPlanner> selectmyPlan(String mbid) {
		return sqlSession.selectList(NAMESPACE + "selectmyPlan", mbid);
	}

	public int updateMyProfile(Member mvo) {
		return sqlSession.update(NAMESPACE + "updateProfile", mvo);	
	}
}
