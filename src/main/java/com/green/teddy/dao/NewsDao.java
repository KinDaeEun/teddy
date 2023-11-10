package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.News;

public interface NewsDao {

	List<News> list();

	News select(int nno);
	
	News recentNews();

	int getTotal(News news);

	List<News> nlist(News news);

	int adminGetTotal(News news);

	List<News> adminNewsList(News news);

	int adminDelete(News news);

	int insert(News news);

	News hotNews();

}
