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

	public List<Review> reviewList(int cno) {
		return sst.selectList("reviewns.reviewList", cno);
	}
}
