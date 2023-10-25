package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.teddy.dto.Compliment;
import com.green.teddy.dto.Member;
import com.green.teddy.service.BoardService;
import com.green.teddy.service.ComplimentService;
import com.green.teddy.service.MemberService;
import com.green.teddy.service.PageBean;

@Controller
public class BoardController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BoardService bs;
	@Autowired
	private ComplimentService cs;

	@GetMapping("board/notice")
	public void notice() {
	}

	@GetMapping("board/board_memu")
	public void board_memu() {
	}

	@GetMapping("board/complimentMain")
	public void complimentMain(Model model, String id) {
	Member member = ms.select(id);
	model.addAttribute("member", member);
	}

	@PostMapping("board/complimentResult")
	public void complimentResult(Model model,String id,Compliment compliment){
		int result = 0;
		Member member = ms.select(id);
		result = cs.coinsert(compliment);
		
		model.addAttribute("member", member);
		model.addAttribute("result", result);
	}
	
	
	@GetMapping("board/complimentList")
	public void complimentList(String id, Model model, HttpSession session, String pageNum, Compliment compliment) {
		Member member = ms.select(id);
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = cs.comGetTotal(compliment);// 칭찬 총 등록갯수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		compliment.setStartRow(startRow);
		compliment.setEndRow(endRow);

		List<Compliment> list = cs.cpList(compliment);// 칭찬목록 리스트
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		model.addAttribute("id", id);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("compliment", compliment);
		model.addAttribute("member", member);
	}


}
