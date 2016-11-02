package com.model.afk.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.model.afk.member.vo.Member;

@Repository
public class MemberDao {
	private static final String NAMESPACE = "memberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	public Member loginMember(Member umember){
		return sqlSession.selectOne(NAMESPACE+"selectid",  umember);
	}
	
	public int insertMember(Member temp) {
	 return sqlSession.insert(NAMESPACE+"insertMember", temp);
	}
	
	public int updateMember(Member temp) {
		return sqlSession.update(NAMESPACE+"updateMember", temp);
	}
	
	public int deleteMember(Member temp) {
		System.out.println("DAO :::::::::::: " + temp);
			return sqlSession.delete(NAMESPACE+"deleteMember",temp);
			
	}
	public int confirmUserId(Member temp){
		
		return sqlSession.selectOne(NAMESPACE+"confirmUserId", temp);
	}

	public Member updateViewMember(Member member) {
		
		return sqlSession.selectOne(NAMESPACE+"updateView",member);
	}

	public Member idSearching(Member member) {
		
		return sqlSession.selectOne(NAMESPACE+"idSearching",member);
	}

	public Member getPw(Member member) {
		
		return sqlSession.selectOne(NAMESPACE+"getPw",member);
		
	}

	public int updateMember1(Member temp) {
		
		return sqlSession.update(NAMESPACE+"updateMember1",temp);
	}

	


}
