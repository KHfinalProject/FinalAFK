package com.model.afk.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.model.afk.notice.service.NoticeService;
import com.model.afk.notice.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	
	public String noticeInsert(Notice notice, Model model){
		
		notice = ns.noticeInsert();
		return null;
		
		
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
