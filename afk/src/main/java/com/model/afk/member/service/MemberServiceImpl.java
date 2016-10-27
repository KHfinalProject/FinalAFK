package com.model.afk.member.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.model.afk.member.dao.MemberDao;
import com.model.afk.member.vo.Member;


@Service
public class MemberServiceImpl implements MemberService{


@Autowired MemberDao dao;
@Override
public Member loginMember(Member umember){
	return dao.loginMember(umember);
}

@Override
public int updateMember(Member temp) {
	return dao.updateMember(temp);
}
@Override
public int deleteMember() {
	return 0;
}
@Override
public int insertMember(Member temp) {

	return dao.insertMember(temp);
}
public int confirmUserId(Member temp){
	System.out.println("SI ::::::::::: " + temp);
	return dao.confirmUserId(temp);
}

@Override
public Member updateViewMember(Member member) {
	
	return dao.updateViewMember(member);
}



}
