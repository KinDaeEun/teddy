package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.News;
import com.green.teddy.service.BoardService;
import com.green.teddy.service.CarService;
import com.green.teddy.service.NewsService;

@Controller
public class MainController {
	@Autowired
	private NewsService ns;
	@Autowired
	private BoardService bs;
	@Autowired
	private CarService cs;
	
	@GetMapping("main/main")
	public void main(Model model) {
		// 뉴스
		List<News> news = ns.list();
		// 게시판
		List<Board> board = bs.bcntlist();
		//차량
		List<Car> carList = cs.mainCar();
		

		
		model.addAttribute("news", news);
		model.addAttribute("board", board);
		model.addAttribute("carList", carList);
	}
}
