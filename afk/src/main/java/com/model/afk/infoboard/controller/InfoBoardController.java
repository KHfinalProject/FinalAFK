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
		 System.out.println(info_no);
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
	 
	// 디테일 페이지 조회수 증가 처리, 신고
			 @RequestMapping(value="/{info_no}", method=RequestMethod.GET)
			 public String getInfoDetail(Model model, @PathVariable(value="info_no") int info_no,
					 @RequestParam(value="page", defaultValue="1") int page){
				 int result = bsvc.addCount(info_no);
				 System.out.println(";;;;;;;;;;;;" + info_no);
				 InfoBoardVO board = null;
				 List<InfoNotifyVO> notify = null;
				 
				 System.out.println("mmmmmmmmmmmmmmmmm" + notify);
				 if(result > 0){
					 board = bsvc.boardDetail(info_no);
					 notify = bsvc.getNotifyList(info_no);
				 }
				 
				 model.addAttribute("board",board);
				 model.addAttribute("notify", notify);
				 
				 return "infoboard/detail";
			 }
	 
	 
	 @RequestMapping("selectBoardReport")
	 public @ResponseBody InfoReportVO selectBoardReport(InfoReportVO vo){
		 //즐겨찾기 상태를 가져오는 메소드
		 InfoReportVO report = null;
		 report = brsvc.selectBoardReport(vo);
		
		 return report;
	 }
	 
	 @RequestMapping("insertBoardReport")
	 public @ResponseBody int insertBoardReport(InfoReportVO vo){
		 //즐겨찾기 추가하는 메소드
		 int result = 0;
		 result = brsvc.insertBoardReport(vo);
		 
		 return result;
	 }
	 
	 @RequestMapping("deleteBoardReport")
	 public @ResponseBody int deleteBoardReport(@RequestParam("no") int no){
		 //즐겨찾기를 삭제하는 메소드
		 int result = 0;
		 result = brsvc.deleteBoardReport(no);
		 System.out.println(result);
		 
		 return result;
	 }
	 
	 @RequestMapping("selectBoardComment")
	 public @ResponseBody List<InfoCommentVO> selectBoardComment(
			 @RequestParam("bno") int bno){
		 //댓글 목록을 불러오는 메소드
		 System.out.println(bno);
		 List<InfoCommentVO> list = null;
		 list = bcsvc.selectBoardComment(bno);
		 System.out.println(list);
		 
		 return list;
	 }
	 
	 @RequestMapping("insertBoardComment")
	 public @ResponseBody int insertBoardComment(InfoCommentVO vo){
		 //댓글 삽입하는 메소드
		 System.out.println(vo);
		 int result = 0;
		 result = bcsvc.insertBoardComment(vo);
		 System.out.println(result);
		 
		 return result;
	 }
	 
	 @RequestMapping("deleteBoardComment")
	 public @ResponseBody int deleteBoardComment(@RequestParam("cno") int cno) {
		 //댓글삭제
		 int result = 0;
		 result = bcsvc.deleteBoardComment(cno);
		 
		 return result;
	 }

	 public String insertBoardPoint(InfoPointVO vo){
		 int result = bpsvc.insertBoardPoint(vo);
		 //평점주기
		 return null;
	 }
	 /*public String insertBoardNotify(InfoNotifyVO vo) {
		 int result = bnsvc.insertBoardNotify(vo);
		 //신고하기
		 return null;
	 }*/
	 
	 @RequestMapping("/notify")
	 public @ResponseBody int notify(@RequestParam int info_no, @RequestParam String user){
		 int result = bsvc.notify(info_no, user);
		 if(result > 0)
			 System.out.println("신고 성공");
		 
		 return result;
	 }
	 
	 @RequestMapping("/notifyCencel")
	 public @ResponseBody int notifyCencel(@RequestParam int info_no, @RequestParam String user){
		 int result = bsvc.notifyCencel(info_no, user);
		 if(result > 0)
			 System.out.println("신고 취소");
		 
		 return result;
	 }
	 
}
