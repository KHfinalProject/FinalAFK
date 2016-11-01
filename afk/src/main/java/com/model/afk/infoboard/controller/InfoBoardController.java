package com.model.afk.infoboard.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.afk.infoboard.service.InfoBoardCommentService;
import com.model.afk.infoboard.service.InfoBoardNotifyService;
import com.model.afk.infoboard.service.InfoBoardPointService;
import com.model.afk.infoboard.service.InfoBoardReportService;
import com.model.afk.infoboard.service.InfoBoardService;
import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.infoboard.vo.InfoCommentVO;
import com.model.afk.infoboard.vo.InfoNotifyVO;
import com.model.afk.infoboard.vo.InfoPointVO;
import com.model.afk.infoboard.vo.InfoReportVO;

@Controller
@RequestMapping("/infoboard")
@SessionAttributes("InfoBoardVO")
public class InfoBoardController { 
	 @Autowired private InfoBoardService bsvc;
	 @Autowired private InfoBoardCommentService bcsvc;
	 @Autowired private InfoBoardReportService brsvc;
	 @Autowired private InfoBoardPointService bpsvc;
	 @Autowired private InfoBoardNotifyService bnsvc;
	 
	 public String insertBoard(InfoBoardVO vo){
		 int result = bsvc.insertBoard(vo);
		 //게시물 추가
		 return null;
	 }
	 public String deleteBoard(int bno, HttpSession session){
		 int result = bsvc.deleteBoard(bno);
		 //게시물 삭제
		 return null;
	 }
	 @RequestMapping("")
	 public String getBoardList(Model model,
			 @RequestParam(value="page", defaultValue= "1") int page) {
		 List<InfoBoardVO> list = bsvc.getBoardList(page);
		 //게시물 리스트
		 model.addAttribute("boardlist", list);
		 return "infoboard/list";
	 }
	 //더보기클릭시URL
	 @RequestMapping("/infomore.do")
	 public @ResponseBody List<InfoBoardVO> infopaging(HttpServletResponse response,
			 @RequestParam int page) throws Exception{
		 System.out.println("=================MoreList.do======================");
		 List<InfoBoardVO> list = bsvc.getBoardList(page);
		 JSONObject json = new JSONObject();
		 JSONArray jarr = new JSONArray();
		 System.out.println(list);
		 for(InfoBoardVO b : list){
			 JSONObject job = new JSONObject();
			 job.put("info_no", b.getInfo_no());
			 job.put("info_title", URLEncoder.encode(b.getInfo_title(), "UTF-8"));
			 job.put("info_content", URLEncoder.encode(b.getInfo_content(), "UTF-8"));
			 job.put("info_writer", URLEncoder.encode(b.getInfo_writer(), "UTF-8"));
			 job.put("info_enrolldate", b.getInfo_enrolldate());
			 job.put("info_loc_l", URLEncoder.encode(b.getInfo_loc_l(), "UTF-8"));
			 job.put("info_loc_m", URLEncoder.encode(b.getInfo_loc_m(), "UTF-8"));
			 job.put("info_loc_s",  URLEncoder.encode(b.getInfo_loc_s(), "UTF-8"));
			 job.put("info_count", b.getInfo_count());
			 job.put("info_point", b.getInfo_point());
			 job.put("info_notify", b.getInfo_notify());
			 job.put("info_price", b.getInfo_price());
			 job.put("info_map",  URLEncoder.encode(b.getInfo_map(), "UTF-8"));
			 
			 jarr.add(job);
		 }
		 
		 json.put("list", jarr);
		 System.out.println("ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ");
		 System.out.println(json.toJSONString());
		 response.setContentType("application/json");
		 PrintWriter out = response.getWriter();
		 out.print(json.toJSONString());
		 out.flush();
		 out.close();
		 
		 return list;
		 
	 }
	 
	 
	 public String updateBoard(InfoBoardVO vo){
		 int result = bsvc.updateBoard(vo);
		 //게시물수정
		 return null;
	 }
	 @RequestMapping(value="/{info_no}", method=RequestMethod.GET)
	 public String getBoardDetail(@PathVariable int info_no, Model model) {
		 /*InfoBoardVO board = bsvc.getBoardDetail(bno);*/
		 //게시물디테일
		 model.addAttribute("boardDetail", bsvc.getBoardDetail(info_no));
		 		
		 return "infoboard/detail";
	 }
	 public String insertBoardReport(InfoReportVO vo) {
		 int result = brsvc.insertBoardReport(vo);
		 //즐겨찾기추가
		 return null;
	 }
	 public String insertBoardComment(InfoCommentVO vo){
		 int result = bcsvc.insertBoardComment(vo);
		 //댓글추가
		 return null;
	 }
	 public String deleteBoardComment(int cno) {
		 int result = bcsvc.deleteBoardComment(cno);
		 //댓글삭제
		 return null;
	 }
	 public String updateBoardComment(InfoCommentVO vo){
		 int result = bcsvc.updateBoardComment(vo);
		 //댓글수정
		 return null;
	 }
	 public String insertBoardPoint(InfoPointVO vo){
		 int result = bpsvc.insertBoardPoint(vo);
		 //평점주기
		 return null;
	 }
	 public String insertBoardNotify(InfoNotifyVO vo) {
		 int result = bnsvc.insertBoardNotify(vo);
		 //신고하기
		 return null;
	 }
}
