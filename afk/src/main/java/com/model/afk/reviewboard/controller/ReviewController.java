package com.model.afk.reviewboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.afk.reviewboard.service.ReviewService;
import com.model.afk.reviewboard.vo.Review;

@Controller
public class ReviewController {
	@Autowired ReviewService rs;
	
	@RequestMapping("")
	public String listReview(){
		List<Review> list = rs.listReview();
		//후기 게시판 글 불러오기
		return null;
	}
	
	@RequestMapping("")
	public String detailReview(){
		Review review = rs.detailReview();
		//후기 게시물 상세보기
		return null;
	}

	@RequestMapping("")
	public String insertFormReview(){
		//후기 게시판 글 불러오기
		return null;
	}
	
	@RequestMapping("")
	public String insertReview(){
		int result = rs.inserReview();
		//후기 게시글 등록
		return null;
	}
	
	@RequestMapping("")
	public String deleteReview(){
		int result = rs.deleteReview();
		//후기 게시글 삭제
		return null;
	}
	
	@RequestMapping("")
	public String updateFormReview(){
		Review review = rs.updateFormReview();
		//후기 게시글 수정 페이지 불러오기
		return null;
	}
	
	@RequestMapping("")
	public String updateReview(){
		int result = rs.updateReview();
		//후기 게시글 수정
		return null;
	}
	
	@RequestMapping("")
	public String notifyReview(){
		int result = rs.notifyReview();
		//후기 게시글 신고
		return null;
	}
}
