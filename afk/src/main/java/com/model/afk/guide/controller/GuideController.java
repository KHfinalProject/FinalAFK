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
import com.model.afk.member.vo.Member;


@RequestMapping("/guide")
@Controller("guideController")
public class GuideController {
	
	@Autowired 
	@Qualifier("guideBoardService")
	private GuideBoardService guideBoardService;
	
	@Autowired
	@Qualifier("guideCommentService")
	private GuideCommentService guideCommentService;
	
	//가이드 메인 페이지의 틀 로딩
	@RequestMapping("/guideMain")
	public String getGuideMain(Model model, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("======================guideMain=============");
		System.out.println("page : " + page);
		List<GuideItem> list = guideBoardService.getGuideList(page, code);
		model.addAttribute("list", list);
		
		return "guide/main";
	}
	
	//가이드 메인 페이지에서 더보기 클릭 시 추가 데이터 로딩
	@RequestMapping("/guideMore")
	public @ResponseBody List<GuideItem> getMoreGuideItems(@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code) throws Exception{
		System.out.println("======================guideMore====================");
		List<GuideItem> list = guideBoardService.getGuideList(page, code);
				
		return list;
	}
	
	//가이드 아이디 클릭 시 해당 가이드의 페이지로 이동
	@RequestMapping("/guideSub")
	public String getAllItems(Model model, @RequestParam String writer, 
			@RequestParam(value="page", defaultValue="1") int page){
		System.out.println("=====================guideSub======================");
		
		List<GuideItem> list = guideBoardService.getAllItems(writer, page);
		Member guide = guideBoardService.getGuideInfo(writer);
		
		model.addAttribute("list", list);
		model.addAttribute("guide", guide);
		
		System.out.println(list.toString());
		
		return "guide/sub";
	}
	

	//상품 사진 클릭 시 해당 상품 상세 페이지로 이동
	@RequestMapping("/guideDetail")
	public String getOneItem(Model model, @RequestParam int itemNo, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam String writer){
		
		int result = guideBoardService.addCount(itemNo);
		
		if(result > 0){
			List<GuideComment> commentList = guideCommentService.getAllComments(itemNo, page);
			GuideItem guideItem = guideBoardService.getOneItem(itemNo);
			Member guide = guideBoardService.getGuideInfo(writer);
			
			model.addAttribute(commentList);
			model.addAttribute(guideItem);
			model.addAttribute(guide);
			
			System.out.println(guide.toString());
		}	
		
		return "guide/detail";
	}
	
	@RequestMapping("/notifyGuideItem")
	public void notifyItem(@RequestParam int itemNo){
		int result = guideBoardService.notifyItem(itemNo);
	}
	
	@RequestMapping("/insertGuideForm")
	public String insertGuideForm(){
		//가이드 글쓰기 페이지로 이동하는 메소드
		return "guide/insertGuideForm";
	}
	
	@RequestMapping("/insertItem")
	public String insertItem(GuideItem gi, HttpServletResponse response){
		System.out.println(gi);
		
		int result = guideBoardService.insertItem(gi);
		
		if(result > 0){
			try {
				response.sendRedirect("/afk/guide/guideMain");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "guide/detail";
	}	
	
	@RequestMapping("/addFavorite")
	public void addFavoriteGI(String user, int itemNo){
		int result = guideBoardService.addFavoriteGI(user, itemNo);
	}
	
	@RequestMapping("/removeFavorite")
	public void removeFavoriteGI(String user, int itemNo){
		int result = guideBoardService.removeFavoriteGI(user, itemNo);
		
	}
	
	public String searchGuide(Model model, String keyword){
		
		return "guide/main";
	}
	
	public String searchItem(Model model, String keyword){
		
		return "guide/sub";
	}
	

	
	public String updateItem(Model model, SessionStatus sessionStatus, BindingResult result){
		
		return "guide/detail";
	}
	
	public String deleteItem(HttpSession session, int guideNo){
		
		return "guide/sub";
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
	
	
	//페이지 로딩 시 전체적인 틀만 먼저 로딩
	@RequestMapping("/test.do")
		public String test(Model model, 
				@RequestParam(value="testNo", defaultValue= "1") int testNo){
			System.out.println("=================guideMain.do======================");
			List<Test> list = guideBoardService.paging(testNo);
			model.addAttribute("list", list);
			return "guide/test";
		}
		
		//더보기 버튼 클릭 시 다음 데이터 불러옴
	@RequestMapping("/testMore.do")
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
}
