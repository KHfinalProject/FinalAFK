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

import com.model.afk.email.Email;
import com.model.afk.email.EmailSender;
import com.model.afk.member.service.MemberService;
import com.model.afk.member.vo.Member;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired MemberService ms;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email Email;
	@RequestMapping(value="/mlogin", method= RequestMethod.POST)
	public String loginMember(@RequestParam("mb_id") String Id,
							  @RequestParam("mb_pwd") String pwd,
							
							  HttpSession session){	
		Member member = ms.loginMember(new Member(Id,pwd,null,null,null));
		if(member != null){
			session.setAttribute("loginUser", member);
			return "header";
		}else{
			
			return "fail";
		}
}

	@RequestMapping(value="/loginView",method=RequestMethod.GET)
	public String insetView(){
		
		return "member/login";
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
		
		return "member/join";
	}
	
	
	@RequestMapping(value="/joinInsert", method= RequestMethod.POST )
	public String insertMember(@RequestParam("mb_id") String Id,
							   @RequestParam("mb_pwd") String pwd,
							   @RequestParam("mb_name") String name,
							   @RequestParam("mb_email") String email,
							   @RequestParam("mb_phone") String phone,
							   HttpSession session){
	Member temp = new Member(Id,pwd,name,email,phone);
	int result = ms.insertMember(temp);
	if(result == 1){

	}
		return "member/loginSuccess";
	} 
	@RequestMapping(value="/updateView", method=RequestMethod.GET)
	public String updateMemberForm(Model model, HttpSession session) {
		
		Member member = ms.updateViewMember((Member)session.getAttribute("loginUser"));
		System.out.println(member.getMb_grade()== 'B');
		model.addAttribute("temp",member);
	
		return "member/mupdate";
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
	
			session.setAttribute("loginUser", "");
		return "member/deleteSuccess";
		}else{
			return "member/deleteSuccess";
		}
		
	} 
	@RequestMapping(value="/confirmUserId", method=RequestMethod.GET)
	public String Joine(@RequestParam("mb_id") String Id, HttpServletRequest request){
	System.out.println(Id);
	 
	Member temp = new Member(Id,null,null,null,null);
	int result = ms.confirmUserId(temp);
	request.setAttribute("result", result);
	return "result";
	}
	@RequestMapping(value="/pagemove", method=RequestMethod.GET)
	public String pageMove(){
		return "header";
	}
	@RequestMapping(value="/idSearch", method=RequestMethod.GET)
	public String idSearch(){
		return "member/idSearchView";
	}
	@RequestMapping(value="/idseaching",method=RequestMethod.GET)
	public String idSearching(Model model,
							  @RequestParam("mb_name")String name,
							  @RequestParam("mb_email")String email){
		Member temp = ms.idSearching(new Member(null,null,name,email,null));
		int result = 0;
		if(temp.getMb_id() != null && temp.getMb_id() != ""){
			// ID 찾을때
			model.addAttribute("temp", temp);
			result = 1;
		} else{
			// ID 못찾을때
			result = 0;
		}
		model.addAttribute("result", result);
		return "idSearchView";
	}
	@RequestMapping(value="/pwSearch", method=RequestMethod.GET)
	public String pwSearch(){
		return "member/pwSearchView";
	}
	
	@RequestMapping(value="/sendMail", method=RequestMethod.GET)
	public String sendEmailAction(Model model,
								  @RequestParam("mb_id")String id,
								  @RequestParam("mb_email")String email) throws Exception{
		
		Member temp = ms.getPw(new Member(id,null,null,email,null));
		int sendMailResult = 0;
		int result = 0;
		int mailResult = 0;
		if(temp.getMb_pwd() != null && ! temp.getMb_pwd().equals("")){
			Email.setContent("비밀번호는 "+temp.getMb_pwd()+" 입니다.");
			Email.setReciver(email);
			Email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
			mailResult = emailSender.SendEmail(Email);
			result = 1;
			System.out.println("::::::::::: cont ::" +  mailResult);
		}else{
			result = 0;
		}
		model.addAttribute("result", result);
		model.addAttribute("mailResult", mailResult);
		return "member/pwSearchView";
		
	}

}
 