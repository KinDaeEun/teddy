package com.green.teddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.service.NewsService;

@Controller
public class NewsController {
	
	private NewsService ns;
	
	@GetMapping("news/newsList")
	public void newsList() {
		
	}
}
