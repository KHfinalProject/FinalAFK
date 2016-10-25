package com.model.afk.member.service;
import java.util.List;
import com.model.afk.member.vo.Member;

public interface MemberService {
	public Member loginMember();
 
	public int insertMember(Member temp);
	
	public int updateMember();
	
	public int deleteMember();
}
