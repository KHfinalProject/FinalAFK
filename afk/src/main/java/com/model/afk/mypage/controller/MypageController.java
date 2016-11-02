package com.model.afk.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.member.vo.Member;
import com.model.afk.mypage.service.MypageService;
import com.model.afk.myplanner.vo.MyPlanner;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired 	private MypageService mpgs;
	
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
	
	/*@RequestMapping("/updateMyProfile")
	public String updateMyProfile(@RequestParam("profilePic") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//내 프로필사진 변경하는 기능
		HttpSession session = request.getSession();
		Member mb = (Member) session.getAttribute("loginUser");
		String mbid = mb.getMb_id();
		System.out.println(mbid);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int sizeLimit = 1024 * 1024 * 5;
		
		String savePath = "resources/mypage";
		String originalFileName = file.getOriginalFilename();
		String renameFileName = mbid + "profile" + "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		//MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		//originalFileName = multi.getFilesystemName("profilefile");
		
		File saveFile = new File(savePath + "\\" + originalFileName);
		File newFile = new File(savePath + "\\" + renameFileName);
		
		if(!saveFile.renameTo(newFile)){
			int read = 0;
			byte[] buf = new byte[1024];
			FileInputStream fin = new FileInputStream(saveFile);
			FileOutputStream fout = new FileOutputStream(newFile);
			
			while((read = fin.read(buf, 0, buf.length)) != -1){
				fout.write(buf);
			}
			fin.close();
			fout.close();
			saveFile.delete();
		}
		
		Member mvo = new Member(mbid, originalFileName, renameFileName);
		int result = mpgs.updateMyProfile(mvo);
		if(result > 0){
			return "redirect:mypage";
		}else{
			return "";
		}
	}*/		
}
