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
	public Member loginMember(){
		return null;
	}
	
	public int insertMember(Member temp) {
	 return sqlSession.insert(NAMESPACE+"insertMember", temp);
	}
	
	public int updateMember() {
		return 0;
	}
	
	public int deleteMember() {
			return 0;
	}
	public int confirmUserId(Member temp){
		System.out.println("DAO :::::::::::: " + temp);
		return sqlSession.selectOne(NAMESPACE+"confirmUserId", temp);
	}
}
