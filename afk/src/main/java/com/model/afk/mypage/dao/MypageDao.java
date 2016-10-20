package com.model.afk.mypage.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao {
	
	private static final String NAMESPACE = "mpgMapper.";
	
	@Autowired 	
	private SqlSession sqlSession;
		//public List<GuideBoardVO>getMyWishList(Map<String, Object> map)
		//public List<InfoBoardVO> getMyFavoriteList(Map<String, Object> map)
		//public List<BoardVO>getMyReviewList(Map<String, Object> map)
	public int updateMyProfile(MemberVO mvo){
		
	}
}
