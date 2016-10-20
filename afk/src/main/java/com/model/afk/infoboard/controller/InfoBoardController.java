package com.model.afk.infoboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.model.afk.infoboard.service.InfoBoardCommentService;
import com.model.afk.infoboard.service.InfoBoardNotifyService;
import com.model.afk.infoboard.service.InfoBoardPointService;
import com.model.afk.infoboard.service.InfoBoardReportService;
import com.model.afk.infoboard.service.InfoBoardService;
import com.model.afk.infoboard.vo.InfoBoard;
import com.model.afk.infoboard.vo.InfoComment;
import com.model.afk.infoboard.vo.InfoNotify;
import com.model.afk.infoboard.vo.InfoPoint;
import com.model.afk.infoboard.vo.InfoReport;

@Controller
public class InfoBoardController {
	 @Autowired private InfoBoardService bsvc;
	 @Autowired private InfoBoardCommentService bcsvc;
	 @Autowired private InfoBoardReportService brsvc;
	 @Autowired private InfoBoardPointService bpsvc;
	 @Autowired private InfoBoardNotifyService bnsvc;
	 
	 public String insertBoard(InfoBoard vo){
		 int result = bsvc.insertBoard(vo);
		 //게시물 추가
		 return null;
	 }
	 public String deleteBoard(int bno, HttpSession session){
		 int result = bsvc.deleteBoard(bno);
		 //게시물 삭제
		 return null;
	 } 
	 public String getBoardList(int bno, int bpage) {
		 List<InfoBoard> list = bsvc.getBoardList(bno);
		 //게시물 리스트
		 return null;
	 }
	 public String updateBoard(InfoBoard vo){
		 int result = bsvc.updateBoard(vo);
		 //게시물수정
		 return null;
	 }
	 public String getBoardDetail(int bno) {
		 InfoBoard board = bsvc.getBoardDetail(bno);
		 //게시물디테일
		 return null;
	 }
	 public String insertBoardReport(InfoReport vo) {
		 int result = brsvc.insertBoardReport(vo);
		 //즐겨찾기추가
		 return null;
	 }
	 public String insertBoardComment(InfoComment vo){
		 int result = bcsvc.insertBoardComment(vo);
		 //댓글추가
		 return null;
	 }
	 public String deleteBoardComment(int cno) {
		 int result = bcsvc.deleteBoardComment(cno);
		 //댓글삭제
		 return null;
	 }
	 public String updateBoardComment(InfoComment vo){
		 int result = bcsvc.updateBoardComment(vo);
		 //댓글수정
		 return null;
	 }
	 public String insertBoardPoint(InfoPoint vo){
		 int result = bpsvc.insertBoardPoint(vo);
		 //평점주기
		 return null;
	 }
	 public String insertBoardNotify(InfoNotify vo) {
		 int result = bnsvc.insertBoardNotify(vo);
		 //신고하기
		 return null;
	 }
}
