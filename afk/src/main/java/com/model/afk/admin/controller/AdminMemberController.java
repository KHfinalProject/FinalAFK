package com.model.afk.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.Member;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService ams;
	
	public String memberListAll(Model model, int page){
		
		Member m = ams.memberListAll();
		return "adminmember/memberList";
		
	}
	
	public String memberDelete(int memNo){
		
		Member m = ams.memberDelete(memNo);
		return null;
	}
	
	public String memberSearch(){
		
		Member m = ams.memberSearch();
		return null;
		
		
	}
	
}
