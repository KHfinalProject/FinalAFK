package com.model.afk.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.matching.vo.Matching;
import com.model.afk.member.vo.Member;
import com.model.afk.myplanner.vo.MyPlanner;
import com.model.afk.payment.vo.Payment;

@Repository
public class MypageDao {
	
	private static final String NAMESPACE = "mypageMapper.";
	
	@Autowired 	
	private SqlSession sqlSession;
	
	public List<InfoBoardVO> selectmyFavorite(String mbid) {
		return sqlSession.selectList(NAMESPACE + "selectmyFavorite", mbid);
	}

	public int updateMyProfile(Member mvo) {
		return sqlSession.update(NAMESPACE + "updateProfile", mvo);	
	}

	public List<GuideItem> selectmyWish(String mbid) {
		return sqlSession.selectList(NAMESPACE + "selectmyWish", mbid);
	}

	public int deleteMyProfile(Member mvo) {
		return sqlSession.delete(NAMESPACE + "deleteMyProfile", mvo);
	}

	public int deleteMyWish(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE + "deleteMyWish", map);
	}

	public List<GuideItem> selectmyGuide(String gid) {
		return sqlSession.selectList(NAMESPACE + "selectmyGuide", gid);
	}

	public List<Matching> selectmyPay(String id) {
		return sqlSession.selectList(NAMESPACE + "selectmyPay", id);
	}

	public List<Matching> selectmyMatching(String id) {
		return sqlSession.selectList(NAMESPACE + "selectmyMatching", id);
	}

	public int deleteMyPay(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE + "deletemyPay", map);
	}

	public int deleteMyMatching(int matchingno) {
		return sqlSession.delete(NAMESPACE + "deletemyMatching", matchingno);
	}

	public List<InfoBoardVO> selectmyInfo(String id) {
		return sqlSession.selectList(NAMESPACE + "selectmyInfo", id);
	}
}
