package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.green.teddy.dao.NewsDao;
import com.green.teddy.dto.News;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsDao nd;

	public List<News> list() {
		return nd.list();
	}

	public News select(int nno) {
		return nd.select(nno);
	}

	public News recentNews() {
		return nd.recentNews();
	}
}
