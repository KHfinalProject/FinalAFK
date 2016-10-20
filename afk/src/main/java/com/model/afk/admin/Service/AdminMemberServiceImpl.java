package com.model.afk.admin.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.admin.dao.AdminMemberDao;
import com.model.afk.admin.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired AdminMemberDao dao;

	@Override
	public Member memberListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member memberDelete(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member memberSearch() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
