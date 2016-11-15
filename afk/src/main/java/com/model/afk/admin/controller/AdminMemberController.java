package com.model.afk.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.AdminMember;


@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService ams;
	
	// 회원 전체 출력 컨트롤러
	@RequestMapping("/memberListView")
	public String memberListAll(Model model, @RequestParam(value="page", defaultValue="1") int page, 
			 @RequestParam(value="code", defaultValue="mb_id") String code, String keyword){
		
		
		List<AdminMember> memberList = ams.getMemberList(page, code, keyword);
		model.addAttribute("memberList", memberList);
		return "admin/memberListView";
		
	}
	
	// 더보기 클릭시
			@RequestMapping("/memberMore")
			 public @ResponseBody List<AdminMember> memberpaging(@RequestParam(value="page", defaultValue="1") int page, 
					 @RequestParam(value="code", defaultValue="mb_id") String code, String keyword) throws Exception{
				 System.out.println("================= MEMBERMORE ======================");
				 List<AdminMember> list = ams.getMemberSelectList(page, code, keyword);
				 
				 System.out.println("=================" + list);
				 		 
				 return list;
				 
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
	public void memberGrUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
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
	
	// 회원 검색 컨트롤러
	@RequestMapping("/memberSearch")
	public String memberSearch(HttpServletRequest request, HttpServletResponse response,
							   Model model) throws IOException{
		
		String memberId = request.getParameter("memberId");
		String keyword = request.getParameter("keyword"); // 검색할 키워드
		String memberName = request.getParameter("memberName");
		String memberGrade = request.getParameter("memberGrade");
		
		List<AdminMember> list = ams.memberSearch(memberId, keyword, memberName, memberGrade);
		System.out.println("==========" + list);
		model.addAttribute("memberList", list);
		
		return "admin/memberListView";
	
		
		
		
	}
}