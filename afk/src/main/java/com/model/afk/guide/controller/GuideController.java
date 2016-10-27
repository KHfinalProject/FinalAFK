package com.model.afk.guide.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.service.GuideCommentService;
import com.model.afk.guide.vo.GuideComment;
import com.model.afk.guide.vo.GuideItem;


@Controller
@RequestMapping("/guide")
public class GuideController {
	
	@Autowired private GuideBoardService gbs;
	@Autowired private GuideCommentService gcs;
	
	@RequestMapping("")
	public String test(){
		return "guide/sub";
	}
	
	public String getAllGuides(Model model, int page){
				
		return "guide/main";
	}
	
	public String getAllItems(Model model, int writerNo, int page){
		
		return "guide/sub";
	}
	
	public String getOneItem(Model model, int guideNo){
		ArrayList<GuideComment> commentList = gcs.getAllComments(guideNo);
		
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
