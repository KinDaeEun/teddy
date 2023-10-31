package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.News;
import com.green.teddy.service.CarService;
import com.green.teddy.service.NewsService;

@Controller
public class MainController {
	/*@Autowired
	private CarService cs;*/
	@Autowired
	private NewsService ns;
	
	@GetMapping("main/main")
	public void main(Model model) {
		/*List<Car> carlist = cs.carList(car);*/
		
		List<News> news = ns.list();
		
		model.addAttribute("news", news);
	}
}
