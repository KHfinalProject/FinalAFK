package com.model.afk.infoboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
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
	 
	 @RequestMapping("/insertForm")
	 public String insertForm(){
		 //게시물 추가 페이지로 이동
		 return "infoboard/insertForm";
	 }
	 
	 @RequestMapping("/insertBoard")
	 public String insertBoard(InfoBoardVO vo, HttpServletResponse response){
		 //게시물 추가
		 System.out.println(vo);
		 
		 int result = bsvc.insertBoard(vo);
		 
		 if(result > 0){
			 try {
				 //게시물 리스트 맵핑으로 이동
				response.sendRedirect("/afk/infoboard");
			} catch (IOException e) {
				e.printStackTrace();
			} 
		 }
		 return null;
	 }
	 
	 @RequestMapping("/deleteInfoBoard")
	 public String deleteBoard(@RequestParam("info_no") int info_no , HttpServletResponse response){
		 int result = bsvc.deleteBoard(info_no);
		 //게시물 삭제
		 
		 if(result > 0){
			 try {
				 //게시물 리스트 맵핑으로 이동
				response.sendRedirect("/afk/infoboard");
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
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
			 @RequestParam(value="page", defaultValue="1") int page, 
			 @RequestParam(value="code", defaultValue="info_no") String code) throws Exception{
		 System.out.println("=================MoreList.do======================");
		 List<InfoBoardVO> list = bsvc.getBoardSelectList(page, code);
		 		 
		 return list;
		 
	 }
	 @RequestMapping("/infoup.do")
	 public @ResponseBody List<InfoBoardVO> getBoardSelectList(Model model,
			 @RequestParam(value="page", defaultValue="1") int page,
			 @RequestParam(value="code", defaultValue="info_no") String code){
		 List<InfoBoardVO> list = bsvc.getBoardSelectList(page, code);
		 model.addAttribute("boardlist", list);
		 return list;
	 }
	 
	 @RequestMapping("/updateInfoBoardForm")
	 public String updateInfoBoardForm(@RequestParam("info_no") int info_no, Model model){
		 //게시글 수정 페이지로 이동
		 InfoBoardVO vo = bsvc.getBoardDetail(info_no);
		 
		 if(vo != null){
			 model.addAttribute("infoboard", vo);
			 return "infoboard/updateForm";
		 }
		 return null;
	 }
	 
	 @RequestMapping("/updateBoard")
	 public String updateBoard(InfoBoardVO vo, HttpServletResponse response){
		 //게시물 수정
		 int result = bsvc.updateBoard(vo);
		 
		 if(result > 0){
			 try {
				 //게시물 디테일보기 맵핑으로 이동
				response.sendRedirect("/afk/infoboard/" + vo.getInfo_no());
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		 
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
