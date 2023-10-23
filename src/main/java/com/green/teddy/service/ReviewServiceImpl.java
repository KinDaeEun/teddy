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

	@Override
	public List<Review> reviewList(int cno) {
		return red.reviewList(cno);
	}
}
