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
import com.green.teddy.dto.Notice;
import com.green.teddy.service.BoardService;
import com.green.teddy.service.ComplimentService;
import com.green.teddy.service.MemberService;
import com.green.teddy.service.NoticeService;
import com.green.teddy.service.PageBean;

@Controller
public class BoardController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BoardService bs;
	@Autowired
	private ComplimentService cs;

	@Autowired
	private NoticeService nis;

	@GetMapping("board/board_memu")
	public void board_memu() {
	}

	// 칭찬 알림방 리스트
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
		model.addAttribute("pageNum", pageNum);
	}

	// 칭찬 알림방 입력
	@RequestMapping("board/rInsert")
	public String rInsert(Model model, Compliment compliment) {
		int result = 0;
		Member member = ms.select(compliment.getId());
		result = cs.coinsert(compliment);
		model.addAttribute("member", member);
		model.addAttribute("result", result);
		return "redirect:/board/complimentMain.do";
	}

	// 칭찬 알림방 삭제
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
	//공지사항
	@GetMapping("board/notice")
	public void adminNotice(Model model, String pageNum, HttpSession session, Notice notice) {
		String id = (String) session.getAttribute("id");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = nis.getTotal(notice);// 공지사항 총 갯수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);

		List<Notice> list = nis.list(notice);// 회원별 문의 리스트
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "제목", "내용", "제목+내용" };
		model.addAttribute("id", id);
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("notice", notice);

	}
	@GetMapping("board/noticeView")
	public void noticeView(Model model, int nno, HttpSession session, String pageNum) {
		nis.updateReadCount(nno);
		Notice notice = nis.select(nno);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
	}
}
