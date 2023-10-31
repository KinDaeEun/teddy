package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.dto.News;
import com.green.teddy.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService ns;
	
	@GetMapping("news/newsList")
	public void newsList(Model model, HttpSession session) {
		List<News> newslist = ns.list(); 
		News recent  = ns.recentNews();
		
		model.addAttribute("recent", recent);
		model.addAttribute("newslist", newslist);
	}
	
	@GetMapping("news/newsContent")
	public void newsContent(Model model, int nno) {
		List<News> newslist = ns.list();
		News news = ns.select(nno);
		
		model.addAttribute("news", news);
		model.addAttribute("newslist", newslist);
	}
}
