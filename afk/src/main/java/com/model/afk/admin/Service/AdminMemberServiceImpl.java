package com.model.afk.admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.admin.dao.AdminMemberDao;
import com.model.afk.admin.vo.AdminMember;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired AdminMemberDao dao;

	@Override
	public List<AdminMember> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(memberId);
	}

	@Override
	public int memberGrUpdate(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberGrUpdate(memberId);
	}

	

	

	
	

}