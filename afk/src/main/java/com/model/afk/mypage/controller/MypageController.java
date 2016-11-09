package com.model.afk.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.service.MemberService;
import com.model.afk.member.vo.Member;
import com.model.afk.mypage.service.MypageService;
import com.model.afk.myplanner.vo.MyPlanner;

@Controller
@RequestMapping("/mypage")
public class MypageController implements ServletContextAware{
	@Autowired private MypageService mpgs;
	@Autowired private MemberService ms;
	
	private ServletContext servletContext;
	
	@RequestMapping("")			
	public String mainMyPage(Model model, HttpSession session){
		return "mypage/mypageMain";	
	}
	
	@RequestMapping("/planlist")
	public void getMyPlannerList(@RequestParam("mbid") String mbid, HttpServletResponse response) throws IOException{
		//마이플래너 리스트 불러오는 기능
		List<MyPlanner> list = mpgs.selectmyPlan(mbid);
		System.out.println(list.toString());
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(MyPlanner plan : list){
			JSONObject job = new JSONObject();
			job.put("title", URLEncoder.encode(plan.getPlan_title() , "UTF-8"));
			job.put("content", URLEncoder.encode(plan.getPlan_content() , "UTF-8"));
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		System.out.println(json.toJSONString());
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping("/favoritelist")
	public void getFavoriteList(@RequestParam("mbid") String mbid, HttpServletResponse response) throws IOException{		
		List<InfoBoardVO> list = mpgs.selectmyFavorite(mbid);
		System.out.println(list.toString());
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(InfoBoardVO board : list){
			JSONObject job = new JSONObject();
			job.put("title", URLEncoder.encode(board.getInfo_title() , "UTF-8"));
			job.put("writer", board.getInfo_writer());
			job.put("content", URLEncoder.encode(board.getInfo_content() , "UTF-8"));
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		System.out.println(json.toJSONString());
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
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
 
	@RequestMapping(value="/updateMyProfile")
	public String updateMyProfile(Member mvo, @RequestParam("loginid") String id, HttpServletRequest request, HttpSession session) throws Exception{
		//사진변경
		System.out.println("updateProfile");
		
		MultipartRequest multi = (MultipartRequest) request;
	    MultipartFile f = multi.getFile("profilePic");

		if(!f.isEmpty()){
			String orgname = f.getOriginalFilename();
			String newname = id + "profile." + orgname.substring(orgname.lastIndexOf(".") + 1);
			String path = request.getServletContext().getRealPath("resources\\images\\mypage");
			System.out.println("path : " + path);
			File file = new File(path + File.separator + newname);
			
			mvo = ms.updateViewMember((Member)session.getAttribute("loginUser"));
			mvo.setMb_original_pic(orgname);
			mvo.setMb_rename_pic(newname);
			mpgs.updateMyProfile(mvo);
			System.out.println(mvo);
			f.transferTo(file);
		}
		//session.setAttribute("loginUser", mvo);
		return "header";
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = servletContext;
		
	}
}
