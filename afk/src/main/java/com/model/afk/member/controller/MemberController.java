package com.model.afk.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value="/joinInsertView",method=RequestMethod.GET)
	public String insertView(){
		
		return "join";
	}
	@RequestMapping(value="/joinInsert", method= RequestMethod.POST )
	public String insertMember(@RequestParam("mb_id") String Id,
							   @RequestParam("mb_pwd") String pwd,
							   @RequestParam("mb_name") String name,
							   @RequestParam("mb_email") String email,
							   @RequestParam("mb_phone") String phone,
							   HttpSession session){
	System.out.println(Id + ", " + pwd +", "+ name + ", " + email +", " +phone);
	Member temp = new Member(Id,pwd,name,email,phone);
	int result = ms.insertMember(temp);
	if(result == 1){
		session.setAttribute("loginUser", temp);
	}
		return "header";
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
