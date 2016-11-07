package com.model.afk.admin.Service;

import java.util.List;

import com.model.afk.admin.vo.AdminMember;

public interface AdminMemberService {
	
	public List<AdminMember> getMemberList();


//	public Member memberSearch();


	public int memberDelete(String memberId);

	public int memberGrUpdate(AdminMember aMember);



}