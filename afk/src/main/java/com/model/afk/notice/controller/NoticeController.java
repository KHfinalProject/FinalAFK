package com.model.afk.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		Notice notice = new Notice('0',title,content,'0',null);
		System.out.println(": :::::::::::::::::controller ::"+notice+":::::::::::::");
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
	// 공지사항수정폼 호출
/*		@RequestMapping(value="/noticeUpdateView", method=RequestMethod.GET)
		public String updateMemberForm(Model model) {
			
			Notice notice = ns.noticeUpdateViewMember();
			model.addAttribute("temp",notice);
		
			return "admin/noticeUpdateView";
		}*/
	
	
	
	
	
	public String noticeListAll(int page, Model model){
		
		model.addAttribute("noticelist", ns.noticeListAll());
		return null;
		
		
	}
	@RequestMapping(value="/noticeDetailView", method= RequestMethod.GET )
	public String noticeDetailView(int notice_no,Model model){
		     /* Map<String,Integer> map = new HashMap<String, Integer>();
		      map.put("notice_no",notice_no);*/
		      Notice notice = ns.noticeDetailView(notice_no);
		      int result = ns.noticeCount(notice_no);
		      model.addAttribute("temp",result);
		      model.addAttribute("temp",notice);
		return "admin/noticeDetailView";
	}
	
	@RequestMapping(value="/noticeUpdateView", method= RequestMethod.GET )
	public String noticUpdateView(int notice_no, Model model){
		Notice notice = ns.noticeUpdateView(notice_no);
		model.addAttribute("temp",notice);
		System.out.println("::::::::::::::::"+notice_no+"::::::::::::");
		return "admin/noticeUpdateView";
	}
	@RequestMapping(value="/noticeUpdate", method= RequestMethod.POST )
	public void noticeUpdate(  @RequestParam("notice_no") int no,
							   @RequestParam("notice_title") String title,
							   @RequestParam("notice_content")String content,
								Model model, HttpServletResponse response) throws IOException{
		Notice notice = new Notice(no,title,content,'0',null);
		
		int result = ns.noticeUpdate(notice);
		
		System.out.println("result :: " + result);
		if(result > 0)
		response.sendRedirect("customer"); 
		
		
	}
}
