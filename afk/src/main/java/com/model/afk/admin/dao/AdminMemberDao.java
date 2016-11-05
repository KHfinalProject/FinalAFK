package com.model.afk.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.admin.vo.AdminGrade;
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

	public int memberGrUpdate(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + "memberGrUpdate", memberId);
	}

	public List<AdminGrade> getAdminGrade() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "gradeAll");
	}

}