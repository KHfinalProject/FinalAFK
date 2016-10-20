package com.model.afk.admin.Service;

import com.model.afk.admin.vo.Member;

public interface AdminMemberService {

	public Member memberListAll();

	public Member memberDelete(int memNo);

	public Member memberSearch();

}
