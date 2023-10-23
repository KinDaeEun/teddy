package com.green.teddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@GetMapping("board/notice")
	public void notice() {}
	@GetMapping("board/board_memu")
	public void board_memu() {
	}
}
