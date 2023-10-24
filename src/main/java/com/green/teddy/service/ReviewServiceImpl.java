package com.green.teddy.service;

import com.green.teddy.dao.ReviewDao;
import com.green.teddy.dto.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao red;

	public int reviewInsert(Review review) {
		return red.reviewInsert(review);
	}

	public List<Review> reviewList(Review review) {
		return red.reviewList(review);
	}

	public int getTotal(int cno) {
		return red.getTotal(cno);
	}

	public float rateAvg(int cno) {
		return red.rateAvg(cno);
	}

	public int reviewDelete(int re_no) {
		return red.reviewDelete(re_no);
	}
}
