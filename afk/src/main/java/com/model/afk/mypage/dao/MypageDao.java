package com.model.afk.mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.member.vo.Member;

@Repository
public class MypageDao {
	
	private static final String NAMESPACE = "mpgMapper.";
	
	@Autowired 	
	private SqlSession sqlSession;
		//public List<GuideBoardVO>getMyWishList(Map<String, Object> map)
		//public List<InfoBoardVO> getMyFavoriteList(Map<String, Object> map)
		//public List<BoardVO>getMyReviewList(Map<String, Object> map)
	public int updateMyProfile(Member mvo){
		return 0;
		
	}
}
