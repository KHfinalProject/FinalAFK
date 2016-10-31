package com.model.afk.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.Member;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService ams;
	
	// 회원 전체 출력 컨트롤러
	@RequestMapping("/memberListView")
	public String memberListAll(Model model, int page, Member m){
		
		List<Member> memberList = ams.getMemberList(m);
		model.addAttribute("memberList", memberList);
		return "memberListview";
		
	}
	
	// 회원 삭제 컨트롤러
	@RequestMapping("/memberdelete")
	public String memberDelete(int memNo, Model model){
		
		int result = ams.memberDelete(memNo);
		model.addAttribute("memberDelete", result);
		return "memberListView";
		
	}
	
	// 회원 검색 컨트롤러
	public String memberSearch(){
		
		Member m = ams.memberSearch();
		return null;
	}
	
	public String memberUpdate(){
		return null;
		
	}
	
}
