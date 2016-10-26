package com.model.afk.member.service;
import java.util.List;
import com.model.afk.member.vo.Member;


public interface MemberService {
	public Member loginMember(Member member);
 
	public int insertMember(Member temp);
	
	public int updateMember();
	
	public int deleteMember();
	
	public int confirmUserId(Member temp);
}
