package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.teddy.dto.Help;
import com.green.teddy.dto.Member;
import com.green.teddy.service.HelpService;
import com.green.teddy.service.MemberService;
import com.green.teddy.service.PageBean;

@Controller
public class HelpController {
	@Autowired
	private HelpService hs;

	@GetMapping("help/faqList") // FAQ 리스트 창으로 이동
	public void faqList() {
	}

	@GetMapping("help/helpInsertForm") // 1:1 문의 사항 입력 창
	public void helpForm(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);

	}

	@PostMapping("help/helpInsertResult") // 1:1 문의 사항 입력
	public void helpInsertResult(Model model, HttpSession session, Help help) throws IOException {

		int result = 0;
		String id = (String) session.getAttribute("id");

		String fileName = help.getFile().getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			UUID uuid = UUID.randomUUID();
			String h_fileName = uuid + fileName.substring(fileName.lastIndexOf("."));
			help.setH_fileName(h_fileName);
			help.setId(id);
			System.out.println(help.getH_title());
			System.out.println(help.getFile());
			System.out.println(help.getH_content());
			System.out.println(help.getH_fileName());
			System.out.println(help.getId());
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + h_fileName));
			fos.write(help.getFile().getBytes());
			fos.close();
			result = hs.insert(help);
		}
		model.addAttribute("id", id);
		model.addAttribute("result", result);
	}

	@PostMapping("help/helpUpdateResult") //1:1문의 사항업데이트
	public void helpUpdateResult(Help help, Model model, String pageNum, HttpSession session) throws IOException {
		int result = 0;
		String id = (String) session.getAttribute("id");
		String fileName = help.getFile().getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			UUID uuid = UUID.randomUUID();
			String h_fileName = uuid + fileName.substring(fileName.lastIndexOf("."));
			help.setH_fileName(h_fileName);
			help.setId(id);
			System.out.println(help.getH_title());
			System.out.println(help.getFile());
			System.out.println(help.getH_content());
			System.out.println(help.getH_fileName());
			System.out.println(help.getId());
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + h_fileName));
			fos.write(help.getFile().getBytes());
			fos.close();
			result = hs.update(help);
			model.addAttribute("id", id);
			model.addAttribute("result", result);
			model.addAttribute("pageNum", pageNum);
		}
	}

	@GetMapping("help/helpList") // 1:1문의 목록
	public void helpList(Model model, HttpSession session, String pageNum, Help help) {
		String id = (String) session.getAttribute("id");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		help.setId(id);
		int total = hs.getTotal(help);// 회원별 문의 총 갯수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		help.setStartRow(startRow);
		help.setEndRow(endRow);

		List<Help> list = hs.list(help);// 회원별 문의 리스트
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		String[] title = { "제목", "내용", "제목+내용" };
		model.addAttribute("id", id);
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("help", help);
	}

	@GetMapping("help/helpView") //1:1 문의 사항 상세페이지
	public void helpView(int hno, String pageNum, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Help help = hs.select(hno);
		System.out.println("pageNum = " + pageNum);
		model.addAttribute("id", id);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

	@GetMapping("help/helpUpdateForm") //1:1 문의사항 업데이트 폼
	public void helpUpdateForm(Model model, int hno, String pageNum) {
		Help help = hs.select(hno);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

}
