package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teddy.dto.Board;
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
	public void complimentMain(Model model, Member member, Compliment compliment, String pageNum, HttpSession session) {
		String id = (String) session.getAttribute("id");
		member = ms.select(id);
		System.out.println(member);
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

	@RequestMapping("board/rInsert")
	public String rInsert(Model model, Compliment compliment) {
		int result = 0;
		Member member = ms.select(compliment.getId());
		result = cs.coinsert(compliment);
		model.addAttribute("member", member);
		model.addAttribute("result", result);
		return "redirect:/board/complimentMain.do";
	}
	@GetMapping("board/complimentDelete")
	public void complimentDelete(Model model, HttpSession session, int cpno) {
		String id = (String) session.getAttribute("id");
		int result = cs.delete(cpno);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
	}

	// @GetMapping("/board/complimentList")
	// public void complimentList(String id, Model model, HttpSession session,
	// String pageNum, Compliment compliment) {
	// Member member = ms.select(id);
	// if (pageNum == null || pageNum.equals(""))
	// pageNum = "1";
	// int currentPage = Integer.parseInt(pageNum);
	// int rowPerPage = 10;
	// int total = cs.comGetTotal(compliment);// 칭찬 총 등록갯수
	// int startRow = (currentPage - 1) * rowPerPage + 1;
	// int endRow = startRow + rowPerPage - 1;
	// compliment.setStartRow(startRow);
	// compliment.setEndRow(endRow);
	//
	// List<Compliment> list = cs.cpList(compliment);// 칭찬목록 리스트
	// PageBean pb = new PageBean(currentPage, rowPerPage, total);
	// model.addAttribute("id", id);
	// model.addAttribute("list", list);
	// model.addAttribute("pb", pb);
	// model.addAttribute("compliment", compliment);
	// model.addAttribute("member", member);
	// }
	
	// 커뮤니티
	@GetMapping("board/boardList")
	public void boardList() {


	}
	
	// 커뮤니티 게시글 작성폼
	@GetMapping("board/boardInsertForm.do")
	public void boardInsertForm(Model model, Board board, HttpSession session) {
		String id = (String) session.getAttribute("id");
		board.setId(id);
		
		model.addAttribute("id", id);
	}
	
	// 커뮤니티 게시글 작성
	@PostMapping("board/boardInsert.do")
	public void boardInsert(Model model, Board board) {
		int result = bs.insert(board);
		
		model.addAttribute("result", result);
	}
}
