package com.model.afk.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.admin.vo.AdminMember;

@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "AdminMemberMapper.";

	public List<AdminMember> getMemberList() {
		
		return sqlSession.selectList(NAMESPACE + "memberAll");
	}

	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + "deleteMember", memberId);
	}

	public int memberGrUpdate(AdminMember aMember) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + "memberUpdate", aMember);
	}

	public List<AdminMember> memberSearch(String memberId, String keyword, String memberName, String memberGrade) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("keyword", keyword);
		map.put("memberName", memberName);
		map.put("memberGrade", memberGrade);
		return sqlSession.selectList(NAMESPACE + "select", map);
	}

}