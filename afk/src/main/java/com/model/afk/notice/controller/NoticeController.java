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
								int currentPage,Model model, HttpServletResponse response) throws IOException{
		Notice notice = new Notice('0',title,content,'0',null);
		System.out.println(": :::::::::::::::::controller ::"+notice+":::::::::::::");
		int result = ns.noticeInsert(notice);
		
		System.out.println("result :: " + result);
		if(result > 0)
		response.sendRedirect("customer?currentPage="+currentPage+"&nextBlock="); 
		
		
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
	public String noticeDetailView(int notice_no,int currentPage ,Model model){
		     /* Map<String,Integer> map = new HashMap<String, Integer>();
		      map.put("notice_no",notice_no);*/
		      Notice notice = ns.noticeDetailView(notice_no);
		      int result = ns.noticeCount(notice_no);
		      model.addAttribute("temp",result);
		      model.addAttribute("currentPage", currentPage);
		      model.addAttribute("temp",notice);
		return "admin/noticeDetailView";
	}
	
	@RequestMapping(value="/noticeUpdateView", method= RequestMethod.GET )
	public String noticUpdateView(int notice_no,int currentPage, Model model){
		Notice notice = ns.noticeUpdateView(notice_no);
		model.addAttribute("temp",notice);
		model.addAttribute("currentPage", currentPage);
		System.out.println("::::::::::::::::"+notice_no+"::::::::::::");
		return "admin/noticeUpdateView";
	}
	@RequestMapping(value="/noticeUpdate", method= RequestMethod.POST )
	public void noticeUpdate(  @RequestParam("notice_no") int no,
							   @RequestParam("notice_title") String title,
							   @RequestParam("notice_content")String content,
								int currentPage,Model model, HttpServletResponse response) throws IOException{
		Notice notice = new Notice(no,title,content,'0',null);
		
		int result = ns.noticeUpdate(notice);
		
		System.out.println("result :: " + result);
		if(result > 0)
		response.sendRedirect("customer?currentPage="+currentPage+"&nextBlock="); 
	}
	@RequestMapping(value="/noticeDelete", method= RequestMethod.GET )
	public void noticeDelete(int notice_no,int currentPage, HttpServletResponse response ) throws IOException{
		int result = ns.noticeDelete(notice_no);
		if(result>0)
		response.sendRedirect("customer?currentPage="+currentPage+"&nextBlock=");
	}
	@RequestMapping(value="/checkDelete",method= RequestMethod.GET)
	public void noticeDelete(int[] chek,int currentPage, HttpServletResponse response ) throws IOException{
		System.out.println("::::::::::::cont"+chek+"::::::::::::");
		 int result = 0;
		  for( int i = 0; i < chek.length; i++ ){
			  System.out.println(chek[i]);
			   result = ns.noticeDelete(chek[i]);
    		  }
		if(result>0)
		response.sendRedirect("customer?currentPage="+currentPage+"&nextBlock=");
	
	}
}
 