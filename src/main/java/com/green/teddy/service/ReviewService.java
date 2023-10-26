package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Review;

public interface ReviewService {

	int reviewInsert(Review review);

	List<Review> reviewList(Review review);

	int getTotal(int cno);

	float rateAvg(int cno);

	int reviewDelete(int re_no);

	int adminGetTotal(Review review);

	List<Review> adminReviewList(Review review);

	int deleteReview(Review review);

	Review selectReview(int re_no);

}
