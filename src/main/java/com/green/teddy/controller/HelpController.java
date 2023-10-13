package com.green.teddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.service.HelpService;

@Controller
public class HelpController {

	private HelpService hs;

	@GetMapping("faq/faqList")
	public void faqList() {
	}

	@GetMapping("help/helpForm")
	public void helpForm() {

	}
}
