package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int reviewInsert(Review review) {
		return sst.insert("reviewns.reviewInsert", review);
	}

	public List<Review> reviewList(Review review) {
		return sst.selectList("reviewns.reviewList", review);
	}

	public int getTotal(int cno) {
		return sst.selectOne("reviewns.getTotal", cno);
	}

	public float rateAvg(int cno) {
		return sst.selectOne("reviewns.rateAvg", cno);
	}

	public int reviewDelete(int re_no) {
		return sst.update("reviewns.reviewDelete", re_no);
	}

	@Override
	public int adminGetTotal(Review review) {
		return sst.selectOne("reviewns.adminGetTotal",review);
	}

	@Override
	public List<Review> adminReviewList(Review review) {
		return sst.selectList("reviewns.adminReviewList",review);
	}

	@Override
	public int deleteReview(Review review) {
		return sst.update("reviewns.deleteReview",review);
	}

	@Override
	public Review selectReview(int re_no) {
		return sst.selectOne("reviewns.selectReview",re_no);
	}
}
