package com.model.afk.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.AdminMember;


@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService ams;
	
	// 회원 전체 출력 컨트롤러
	@RequestMapping("/memberListView")
	public String memberListAll(Model model){
		
		List<AdminMember> memberList = ams.getMemberList();
		model.addAttribute("memberList", memberList);
		return "admin/memberListView";
		
	}
	
	
	 //회원 삭제 컨트롤러(삭제 클릭)
	@RequestMapping("/admemberDelete")
	public void memberDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String memberId = request.getParameter("memberId");
		int result = ams.memberDelete(memberId);
		model.addAttribute("memberDelete", result);
		
		if(result > 0){
			response.sendRedirect("/afk/memberListView");
		}else{
			System.out.println("삭제실패!");
		}
		
		
	}
	
	// 회원 등급수정 컨트롤러
	@RequestMapping("/admemberUpdate")
	public void memberGrUpdate(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String memberId = request.getParameter("id");
		String memberGrade = request.getParameter("grade");
		
		AdminMember aMember = new AdminMember();
		aMember.setMemberId(memberId);
		aMember.setMemberGrade(memberGrade);
		
		int result = ams.memberGrUpdate(aMember);
		
		if(result > 0){
			response.sendRedirect("/afk/memberListView");
		}else{
			System.out.println("수정 실패!");
		}
	}
	
	@RequestMapping("/updateform")
	public String updateForm(){
		return "admin/memberUpdateView";
		
	}
}