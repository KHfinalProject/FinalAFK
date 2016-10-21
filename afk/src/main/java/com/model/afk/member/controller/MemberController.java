package com.model.afk.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.model.afk.member.service.MemberService;
import com.model.afk.member.vo.Member;

@Controller
public class MemberController {
	@Autowired MemberService ms;
	
	//@RequestMapping("")
	public String loginMember(){
		Member member = ms.loginMember();
		return null;
	}
	
	//@RequestMapping("")
	
	public String insertMember(){
		int result = ms.insertMember();
		return null;
	} 
	
	//@RequestMapping("")
	
	public String updateMember(){
		int result = ms.updateMember();
		return null;
	} 
	
	//@RequestMapping("")
	
	public String deleteMember(){
		int result = ms.deleteMember();
		return null;
	} 
	
}
