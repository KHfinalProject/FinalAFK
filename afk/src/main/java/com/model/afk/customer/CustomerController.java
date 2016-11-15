package com.model.afk.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.AdminMember;
import com.model.afk.notice.service.NoticeService;
import com.model.afk.notice.vo.Notice;
import com.model.afk.paging.Paging;


@Controller
public class CustomerController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private NoticeService ns;
	
	// 고객센터 폼 호출
	@RequestMapping(value="/customer")
	public String customerForm(HttpSession se,Model model, int currentPage,String nextBlock){
		if(currentPage  == 0){
			currentPage = 1;
		}
		int pageBlock = 10;
		int blockCount = 5;
		int AllNoticeCount = ns.allNoticeCount();
		if(nextBlock != null && !nextBlock.equals("")){
		}
		Paging paging = new Paging();
		Map<String, Integer> map = new HashMap<String,Integer>();
		if(nextBlock.equals("")){
			map = paging.Paging(currentPage, pageBlock,blockCount);
			
		}else if(nextBlock != null && ! nextBlock.equals("")){
			map = paging.Paging(currentPage, pageBlock, blockCount,nextBlock,AllNoticeCount);
			currentPage = map.get("currentPage");
		}
		
		
		if(AllNoticeCount > 0){
		List<Notice> NoticeList = ns.getNoticeList(map);
		
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("NoticeList",  NoticeList);
		model.addAttribute("map",  map);
		
		}
		return "admin/customer";
	}
	
	
	
	// 문의하기  클릭할시
	@RequestMapping(value="/mail", method=RequestMethod.POST)
	public String sendMail(HttpServletRequest request){
		
		String subject = request.getParameter("subject");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		try{
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper
										= new MimeMessageHelper(message);
			
			messageHelper.setFrom("dongjin@naver.com");
			messageHelper.setTo("kmgibong@gmail.com");
			messageHelper.setSubject(subject);
			messageHelper.setText(phone);
			messageHelper.setText(email);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}
		
		return "admin/customer";
		
	
}
	// 글쓰기 폼 호출
	@RequestMapping(value="/noticeWrite")
	public String noticeWriteForm(HttpSession se,int currentPage,Model model){
		
		model.addAttribute("currentPage", currentPage);
		return "admin/noticeWrite";
		
	}
}
