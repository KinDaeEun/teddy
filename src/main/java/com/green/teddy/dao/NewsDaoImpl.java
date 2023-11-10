package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Board;
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

	public News recentNews() {
		return sst.selectOne("newsns.recentNews");
	}

	public int getTotal(News news) {
		return sst.selectOne("newsns.getTotal", news);
	}

	public List<News> nlist(News news) {
		return sst.selectList("newsns.nlist", news);
	}

	public int adminGetTotal(News news) {
		return sst.selectOne("newsns.adminGetTotal", news);
	}

	public List<News> adminNewsList(News news) {
		return sst.selectList("newsns.adminNewsList", news);
	}

	public int adminDelete(News news) {
		return sst.update("newsns.adminDelete", news);
	}

	public int insert(News news) {
		return sst.insert("newsns.insert", news);
	}

	public News hotNews() {
		return sst.selectOne("newsns.hotNews");
	}
}
