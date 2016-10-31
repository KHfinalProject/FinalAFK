package com.model.afk.guide.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.service.GuideCommentService;
import com.model.afk.guide.vo.GuideComment;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.Test;


@Controller("guideController")
@RequestMapping("/guide")
public class GuideController {
	
	@Autowired 
	@Qualifier("guideBoardService")
	private GuideBoardService guideBoardService;
	
	@Autowired
	@Qualifier("guideCommentService")
	private GuideCommentService guideCommentService;
	
	//페이지 로딩 시 전체적인 틀만 먼저 로딩
	@RequestMapping("/guideMain.do")
	public String test(Model model, 
			@RequestParam(value="testNo", defaultValue= "1") int testNo){
		System.out.println("=================guideMain.do======================");
		List<Test> list = guideBoardService.paging(testNo);
		model.addAttribute("list", list);
		return "guide/test";
	}
	
	//더보기 버튼 클릭 시 다음 데이터 불러옴
	@RequestMapping("/guideMore.do")
	public @ResponseBody List<Test> test2(HttpServletResponse response,
			@RequestParam int testNo) throws Exception{
		System.out.println("=================MoreList.do======================");
		
		//List<Test> list = guideBoardService.first();
		List<Test> list = guideBoardService.paging(testNo);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Test t : list){
			JSONObject job = new JSONObject();
			job.put("col", t.getCol());
			job.put("title", URLEncoder.encode(t.getTitle(), "UTF-8"));//한글 깨지지 않도록 
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		System.out.println(json.toJSONString());
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
		return list; //List<Test> list 형태로 반환
	}
	
	public String getAllGuides(Model model, int page){
				
		return "guide/main";
	}
	
	public String getAllItems(Model model, int writerNo, int page){
		
		return "guide/sub";
	}
	
	public String getOneItem(Model model, int guideNo){
		List<GuideComment> commentList = guideCommentService.getAllComments(guideNo);
		
		return "guide/detail";
	}
	
	public String searchGuide(Model model, String keyword){
		
		return "guide/main";
	}
	
	public String searchItem(Model model, String keyword){
		
		return "guide/sub";
	}
	
	public String insertItem(Model model, HttpSession session, GuideItem gi, 
			SessionStatus sessionStatus, BindingResult result){
		
		return "guide/detail";
	}
	
	public String updateItem(Model model, SessionStatus sessionStatus, BindingResult result){
		
		return "guide/detail";
	}
	
	public String deleteItem(HttpSession session, int guideNo){
		
		return "guide/sub";
	}
	
	public String addCount(HttpSession session, int guideNo){
		
		return "guide/detail";
	}
	
	public String insertComment(Model model, HttpSession session, 
			SessionStatus sessionStatus, BindingResult result){
		
		return "guide/detail";
	}
	
	
	public String updatecomment(Model model, GuideComment gc, 
			BindingResult result, SessionStatus sessionStatus){
		
		return "guide/detail";
	}
	
	public String deleteCommennt(HttpSession session, int cmNo){
		
		return "guide/detail";
	}
	
	
}
