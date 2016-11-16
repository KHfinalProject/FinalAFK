package com.model.afk.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.matching.vo.Matching;
import com.model.afk.member.service.MemberService;
import com.model.afk.member.vo.Member;
import com.model.afk.mypage.service.MypageService;
import com.model.afk.myplanner.vo.MyPlanner;
import com.model.afk.payment.vo.Payment;

@Controller
@RequestMapping("/mypage")
public class MypageController implements ServletContextAware{
	@Autowired private MypageService mpgs;
	@Autowired private MemberService ms;
	
	private ServletContext servletContext;
	
	@RequestMapping("")			
	public String mainMyPage(){
		return "mypage/mypageMain";	
	}
	
	@RequestMapping("/favoritelist")
	public void getFavoriteList(@RequestParam("mbid") String mbid, HttpServletResponse response) throws IOException{
		//즐겨찾기 목록 불러오기
		List<InfoBoardVO> list = mpgs.selectmyFavorite(mbid);
		System.out.println(list.toString());
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(InfoBoardVO board : list){
			JSONObject job = new JSONObject();
			job.put("title", URLEncoder.encode(board.getInfo_title() , "UTF-8"));
			job.put("writer", board.getInfo_writer());
			job.put("content", URLEncoder.encode(board.getInfo_content() , "UTF-8"));
			job.put("fano", board.getInfo_no());
			job.put("image", board.getInfo_image());
			
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
	
	@RequestMapping("/wishlist")
	public void getMyWishList(@RequestParam("mbid") String mbid, HttpServletResponse response) throws Exception{
		//가이드위시리스트 불러오는 기능
		List<GuideItem> list = mpgs.selectmyWish(mbid);
		System.out.println(list.toString());
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(GuideItem gItem : list){
			JSONObject job = new JSONObject();
			job.put("gno", gItem.getGui_no());
			job.put("title", URLEncoder.encode(gItem.getGui_title() , "UTF-8"));
			job.put("writer", gItem.getGui_writer());
			job.put("image", gItem.getGui_image());
			
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
 
	@RequestMapping(value="/updateMyProfile")
	public String updateMyProfile(Member mvo, @RequestParam("loginid") String id, HttpServletRequest request, HttpSession session) throws Exception{
		//사진변경
		System.out.println("updateProfile");
		
		MultipartRequest multi = (MultipartRequest) request;
	    MultipartFile f = multi.getFile("profilePic");

		if(!f.isEmpty()){
			String orgname = f.getOriginalFilename();	//파일이름가져오기
			String newname = id + "profile." + orgname.substring(orgname.lastIndexOf(".") + 1);	//새 이름으로 '유저id profile + .확장자'로 지정하기
			String path = request.getServletContext().getRealPath("resources\\images\\mypage");	//저장할 경로 설정해주기
			//System.out.println("path : " + path);
			File file = new File(path + File.separator + newname);	//지정된 경로에 새로운 이름으로 저장해주기
			
			mvo = ms.updateViewMember((Member)session.getAttribute("loginUser"));
			mvo.setMb_original_pic(orgname);
			mvo.setMb_rename_pic(newname);
			session.setAttribute("loginUser", mvo);
			mpgs.updateMyProfile(mvo);
			f.transferTo(file);
		}
		return "redirect:/mypage";
	}

	@RequestMapping("/deleteprofile")
	public String deleteMyProfile(Member mvo, HttpSession session){
		//프로필 사진 삭제
		mvo = ms.updateViewMember((Member)session.getAttribute("loginUser"));
		mvo.setMb_original_pic(null);
		mvo.setMb_rename_pic(null);
		session.setAttribute("loginUser", mvo);
		mpgs.deleteMyProfile(mvo);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping("/paylist")
	public void getmyPaylist(@RequestParam ("loginId") String id, HttpServletResponse response) throws Exception{
		//구매한 리스트 불러오기
		List<Matching> paylist = mpgs.selectmypay(id);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		for(Matching list : paylist){
			JSONObject job = new JSONObject();
			job.put("gno", list.getGui_no());
			job.put("title", URLEncoder.encode(list.getGui_title() , "UTF-8"));
			job.put("gname", URLEncoder.encode(list.getMb_name(), "UTF-8"));
			job.put("phone", list.getMb_phone());
			job.put("price", list.getPrice());
			job.put("tnum", list.getTravel_num());		
			job.put("departureDate", list.getDeparture_date());
			job.put("gid", list.getGuide_id());
			job.put("payno", list.getPay_no());
			
			Date pay = list.getPay_date();
			String payDate = sdFormat.format(pay);			
			job.put("payDate", payDate);
			
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
	
	@RequestMapping("/matchinglist")
	public void getmyMatchinglist(@RequestParam ("loginId") String id, HttpServletResponse response) throws Exception{
		//매칭된 목록 불러오기
		List<Matching> matchinglist = mpgs.selectmyMatching(id);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		for(Matching list : matchinglist){
			JSONObject job = new JSONObject();
			job.put("gno", list.getGui_no());
			job.put("title", URLEncoder.encode(list.getGui_title() , "UTF-8"));
			job.put("uname", URLEncoder.encode(list.getMb_name(), "UTF-8"));
			job.put("phone", list.getMb_phone());
			job.put("price", list.getPrice());
			job.put("tnum", list.getTravel_num());
			job.put("departureDate", list.getDeparture_date());
			job.put("matchingno", list.getMat_no());
			
			Date pay = list.getPay_date();
			String payDate = sdFormat.format(pay);			
			job.put("payDate", payDate);
			
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
	
	@RequestMapping("/deletewish")
	public String deleteMyWish(@RequestParam ("wishno") int gui_no, @RequestParam ("loginId") String id, HashMap<String, Object> map){
		map.put("fa_mb_id", id);
		map.put("fa_bd_no", gui_no);
		int result = mpgs.deleteMyWish(map);
		if(result > 0){
			System.out.println("delete");
		}
		return "redirect:/mypage";
	}
	
	@RequestMapping("/guidelist")
	public @ResponseBody List<GuideItem> getmyGuideList(@RequestParam ("loginId") String gid){
		//내가 올린 가이드정보 불러오기
		List<GuideItem> glist = mpgs.selectmyGuide(gid); 
		return glist;
		
	}
	
	@RequestMapping("/deletepay")
	public String deletepay(@RequestParam("payno") int payno, @RequestParam("loginId") String id, HashMap<String, Object> map){
		map.put("payno", payno);
		map.put("id", id);
		mpgs.deleteMyPay(map);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/deletematching")
	public String deletematching(@RequestParam("matchingno") int matchingno){
		mpgs.deleteMyMatching(matchingno);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/myInfolist")
	public @ResponseBody List<InfoBoardVO> selectmyInfo(@RequestParam("loginId") String id){
		//내가 올린 여행정보 목록불러오기
		List<InfoBoardVO> list = mpgs.selectmyInfo(id);
		return list;
	}
	
	
	@Override
	public void setServletContext(ServletContext arg0) {
		this.servletContext = servletContext;
		
	}
}
