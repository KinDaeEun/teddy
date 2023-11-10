package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.News;

public interface NewsService {

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
