package com.green.teddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.service.HelpService;

@Controller
public class HelpController {

	private HelpService hs;

	@GetMapping("help/faqList")
	public void faqList() {
	}

	@GetMapping("help/helpForm")
	public void helpForm() {

	}
}
