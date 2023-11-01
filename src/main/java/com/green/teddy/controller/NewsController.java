package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.News;
import com.green.teddy.service.NewsService;
import com.green.teddy.service.PageBean;

@Controller
public class NewsController {
	@Autowired
	private NewsService ns;
	
	//	뉴스 메인
	@GetMapping("news/newsMain")
	public void newsList(Model model, HttpSession session) {
		List<News> newslist = ns.list(); 
		News recent  = ns.recentNews();
		
		model.addAttribute("recent", recent);
		model.addAttribute("newslist", newslist);

	}
	
	//	뉴스 내용
	@GetMapping("news/newsContent")
	public void newsContent(Model model, int nno) {
		List<News> newslist = ns.list();
		News news = ns.select(nno);
		
		model.addAttribute("news", news);
		model.addAttribute("newslist", newslist);
	}
	
	//	뉴스 목록
	@GetMapping("news/newsList")
	public void newsList(Model model, News news, String pageNum) {
		// 페이징
		int rowPerPage = 4; // 한 페이지에 10개씩 확인
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ns.getTotal(news);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		news.setStartRow(startRow);
		news.setEndRow(endRow);
		
		// 페이지별 첫 번째 게시글 번호
		int num = total - startRow + 1;
		
		// 시작부터 끝까지 읽어라
		List<Board> list = ns.nlist(news);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("news", news);
	}
}
