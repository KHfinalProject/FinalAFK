package com.model.afk.reviewboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.reviewboard.dao.ReviewDao;
import com.model.afk.reviewboard.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDao dao;
	
	@Override
	public List<Review> listReview() {
		return dao.listReview();
	}

	@Override
	public Review detailReview() {
		// TODO Auto-generated method stub
		return dao.detailReview();
	}

	@Override
	public int inserReview() {
		// TODO Auto-generated method stub
		return dao.insertReview();
	}

	@Override
	public int deleteReview() {
		// TODO Auto-generated method stub
		return dao.deleteReview();
	}

	@Override
	public Review updateFormReview() {
		// TODO Auto-generated method stub
		return dao.updateFormReview();
	}

	@Override
	public int updateReview() {
		// TODO Auto-generated method stub
		return dao.updateReview();
	}

	@Override
	public int notifyReview() {
		// TODO Auto-generated method stub
		return dao.notifyReview();
	}
	
}
