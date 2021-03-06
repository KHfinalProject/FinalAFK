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
		 
		//gui_content 중 첨부된 이미지가 있을 시 대표 이미지로 사용
			String img_path = "";
			String content = vo.getInfo_content();
			if(content.indexOf("/afk/resources/upload") != -1){ //gui_content 중 첨부이미지 있을 시
				//img_path 변수에 이미지 저장 경로만 추출하여 저장
				img_path = content.substring(content.indexOf("/afk/resources/upload"), content.indexOf(" title") -1);
				System.out.println("img_path : " + img_path);
				//GuideItem 객체에 이미지 저장 경로 공백을 제거하여 저장
				vo.setInfo_image(img_path.trim());
			}else{//첨부 이미지가 없을 경우 임의로 대표 이미지 설정
				vo.setInfo_image("/afk/resources/images/guide/tempthumb.jpg");
			}
		 
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
	 
	// 인포 메인 검색 컨트롤러
		 @RequestMapping("/infoSearch")
		 public @ResponseBody List<InfoBoardVO> infoSearch(@RequestParam String keyword){
			 List<InfoBoardVO> list = bsvc.infoSearch(keyword);
			 
			 return list;
		 }
		//평점주기임
	@RequestMapping("/pointInsert")
	public @ResponseBody int pointInsert(@RequestParam("score") int score,
						   @RequestParam("p_writer") String writer,
						   @RequestParam("p_board_no") int board_no){
		
		int result = bsvc.pointInsert(score, writer, board_no);
		//맨처음에 point 테이블에 번호랑 글쓴이 둘이묶인 프라이머리키로 입력 성공시1
		int result2 = bsvc.pointInsert2(board_no);
		//그다음에 info_board 테이블에 맞는 번호에다가 평균점수 업데이트
		System.out.println("@@@@@@@@@@@@@@@@@@@");
		System.out.println(result +", " + result2);
		System.out.println("@@@@@@@@@@@@@@@@@@@@");
		
		return result2;
	}
	 
}
