package com.model.afk.admin.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.model.afk.admin.vo.AdminMember;

public interface AdminMemberService {
	
	public List<AdminMember> getMemberList(int page, String code, String keyword);

	public int memberDelete(String memberId);

	public int memberGrUpdate(AdminMember aMember);

	public List<AdminMember> memberSearch(String memberId, String keyword, String memberGrade, String memberName);

	List<AdminMember> getMemberSelectList(int page, String code, String keyword);

}