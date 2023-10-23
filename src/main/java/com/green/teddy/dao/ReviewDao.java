package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Review;

public interface ReviewDao {

	int reviewInsert(Review review);

	List<Review> reviewList(int cno);

}
