package com.green.teddy.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	private SqlSessionTemplate sst;

	@Override
	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}

}
