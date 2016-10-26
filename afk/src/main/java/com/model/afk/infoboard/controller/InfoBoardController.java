package com.model.afk.infoboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	 public String getBoardList(/*int bno, int bpage*/) {
		 //List<InfoBoard> list = bsvc.getBoardList(bno);
		 //게시물 리스트
		 return "infoboard/list";
	 }
	 public String updateBoard(InfoBoardVO vo){
		 int result = bsvc.updateBoard(vo);
		 //게시물수정
		 return null;
	 }
	 @RequestMapping("detail")
	 public String getBoardDetail(/*int bno*/) {
		 /*InfoBoardVO board = bsvc.getBoardDetail(bno);*/
		 //게시물디테일
		 return null;
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
