package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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


}
