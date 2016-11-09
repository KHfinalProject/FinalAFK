package com.model.afk.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.afk.admin.vo.AdminMember;
import com.model.afk.member.vo.Member;
import com.model.afk.notice.service.NoticeService;
import com.model.afk.notice.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	@RequestMapping(value="/noticeInsert", method= RequestMethod.POST )

	public void noticeInsert(@RequestParam("notice_title") String title,
							   @RequestParam("notice_content")String content,
								Model model, HttpServletResponse response) throws IOException{
		Notice notice = new Notice(null,title,content,'0',null);
		System.out.println("::::::::::::::::::controller ::"+notice+":::::::::::::");
		int result = ns.noticeInsert(notice);
		
		System.out.println("result :: " + result);
		if(result > 0)
		response.sendRedirect("customer"); 
		
		
	}
	
	public String noticeDelete(int noticeNo, Model model){
		
		Notice notice = ns.noticeDelete(noticeNo);
		return null;
		
		
	}
	
	public String noticeUpdate(int noticeNo, Notice notice){
		
		Notice notice1 = ns.noticeUpdate(noticeNo);
		return null;
		
	}
	
	public String noticeListAll(int page, Model model){
		
		model.addAttribute("noticelist", ns.noticeListAll());
		return null;
		
		
	}

}
