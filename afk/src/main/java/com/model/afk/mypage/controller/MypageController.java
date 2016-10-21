package com.model.afk.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.afk.mypage.service.MypageService;
import com.model.afk.myplanner.service.MyPlannerService;
import com.model.afk.myplanner.vo.MyPlanner;
import com.model.afk.reviewboard.service.ReviewService;

@Controller
public class MypageController {
	@Autowired 	private MypageService mpgs;
	@Autowired 	private MyPlannerService mpls;
	//@Autowired 	private 	Service 	; //가이드서비스
	@Autowired 	private ReviewService rs;
	//@Autowired	private BoardService bs;
	//@Autowired	private MemberService ms;
	
	//@RequestMapping("")
	public String getMyPlannerList(Model model, HttpSession session){
		//마이플래너 리스트 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String getMyPlannerDetail(MyPlanner mplVo){
		//마이플래너 디테일 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String getMyWishList(Model model, HttpSession session){
		//가이드위시리스트 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String getMyFavoriteList(Model model, HttpSession session){
		//여행정보 즐겨찾기 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String getMyReviewList(Model model, HttpSession session){
		//내가 쓴 후기 리스트 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String updateMyProfile(Model model, HttpSession session){
		//내 프로필사진 변경하는 기능
		return null;
	}
}
