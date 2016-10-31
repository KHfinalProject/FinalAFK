package com.model.afk.admin.Service;

import java.util.List;

import com.model.afk.admin.vo.Member;

public interface AdminMemberService {
	
	public List<Member> getMemberList(Member m);

	public int memberDelete(int memNo);

	public Member memberSearch();

}
