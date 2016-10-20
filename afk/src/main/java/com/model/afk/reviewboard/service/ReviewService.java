package com.model.afk.reviewboard.service;

import java.util.List;

import com.model.afk.reviewboard.vo.Review;

public interface ReviewService {

	List<Review> listReview();

	Review detailReview();

	int inserReview();

	int deleteReview();

	Review updateFormReview();

	int updateReview();

	int notifyReview();

}
