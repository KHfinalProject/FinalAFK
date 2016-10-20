package com.model.afk.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.matching.service.MatchingService;
import com.model.afk.member.service.MemberService;

@Controller
public class MatchingController {
	
	@Autowired
	private GuideBoardService gs;
	private MemberService ms;
	private MatchingService mcs;
	
	public String matAllList(int page, Model model, int gNo, String memberId){
		
		model.addAttribute("guideNo", gNo);
		model.addAttribute("memberList", memberId);
		model =  mcs.matAllList();
		return null;
		
	}

}
