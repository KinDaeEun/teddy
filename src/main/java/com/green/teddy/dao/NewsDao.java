package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.News;

public interface NewsDao {

	List<News> list();

	News select(int nno);
	
	News recentNews();

}
