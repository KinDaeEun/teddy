package com.green.teddy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Review;
import com.green.teddy.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService res;
	
	
	@PostMapping("car/reviewInsert")
	public void revierInsert(Model model, Review review, HttpSession session) {

		String id = (String) session.getAttribute("id");
		review.setId(id);
		int result = res.reviewInsert(review);
		model.addAttribute("cno",review.getCno());
		model.addAttribute("result", result);
	}
	
	@GetMapping("car/reviewDelete")
	public void reviewDelete(Model model, Review review) {
		int result = res.reviewDelete(review.getRe_no());
		
		model.addAttribute("cno", review.getCno());
		model.addAttribute("result", result);
	}
}
