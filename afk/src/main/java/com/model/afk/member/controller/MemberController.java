   package com.model.afk.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping(value="/mlogin", method= RequestMethod.POST)
	public String loginMember(@RequestParam("mb_id") String Id,
							  @RequestParam("mb_pwd") String pwd,
							
							  HttpSession session){	
		Member member = ms.loginMember(new Member(Id,pwd,null,null,null));
		System.out.println(member);
		if(member != null){
			session.setAttribute("loginUser", member);
			return "header";
		}else{
			
			return "fail";
		}
}

	@RequestMapping(value="/loginView",method=RequestMethod.GET)
	public String insetView(){
		
		return "login";
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		if(session != null) {
			session.invalidate();
		}
		return "header";
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
		return "loginSuccess";
	} 
	@RequestMapping(value="/updateView", method=RequestMethod.GET)
	public String updateMemberForm(Model model, HttpSession session) {
		
		Member member = ms.updateViewMember((Member)session.getAttribute("loginUser"));
		
		model.addAttribute("temp",member);
		
		return "mupdate";
	}

	
	@RequestMapping(value="/joinUpdate", method=RequestMethod.GET)
	public String updateMember(Model model,
							   @RequestParam("mb_id") String Id,
							   @RequestParam("mb_pwd") String pwd,
							   @RequestParam("mb_email") String email,
							   @RequestParam("mb_phone") String phone
							   ){
	
		Member temp = new Member(Id,pwd,null,email,phone);
		
		int result = ms.updateMember(temp);
		
		
		model.addAttribute("result", result);
			
		return "result";
	} 
	
	
	@RequestMapping(value="memberDelete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session){
		Member temp = (Member)session.getAttribute("loginUser");
		int result = ms.deleteMember(temp);
		if(result >  0){
		return "deleteSuccess";
		}else{
			return "";
		}
		
	} 
	@RequestMapping(value="/confirmUserId", method=RequestMethod.GET)
	public String Joine(@RequestParam("mb_id") String Id, HttpServletRequest request){
	System.out.println(Id);
	 
	Member temp = new Member(Id,null,null,null,null);
	int result = ms.confirmUserId(temp);
	System.out.println("result ::::::::::::: " + result);
	request.setAttribute("result", result);
	return "result";
	}
	@RequestMapping(value="/pagemove", method=RequestMethod.GET)
	public String pageMove(){
		return "header";
	}
}
