package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.News;

@Repository
public class NewsDaoImpl implements NewsDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<News> list() {
		return sst.selectList("newsns.list");
	}

	public News select(int nno) {
		return sst.selectOne("newsns.select", nno);
	}
}
