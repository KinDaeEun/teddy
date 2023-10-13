package com.green.teddy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.teddy.dto.Help;
import com.green.teddy.dto.Member;
import com.green.teddy.service.HelpService;
import com.green.teddy.service.MemberService;

@Controller
public class HelpController {

	private HelpService hs;

	private MemberService ms;

	@GetMapping("help/faqList")
	public void faqList() {
	}

	@GetMapping("help/helpForm")
	public void helpForm(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		
	}

}
