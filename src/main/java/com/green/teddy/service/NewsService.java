package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.News;

public interface NewsService {

	List<News> list();

	News select(int nno);

	News recentNews();

	int getTotal(News news);

	List<Board> nlist(News news);

}
