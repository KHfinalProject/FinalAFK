package com.model.afk.member.service;
import java.util.List;
import com.model.afk.member.vo.Member;


public interface MemberService {
	public Member loginMember(Member member);
 
	public int insertMember(Member temp);
	
	public int updateMember(Member temp);
	
	public int deleteMember();
	
	public int confirmUserId(Member temp);

	public Member updateViewMember(Member member);
}
