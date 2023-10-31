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
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.teddy.dto.Notice;
import com.green.teddy.service.MemberService;
import com.green.teddy.service.NoticeService;

@Controller
public class AdminNoticeController {
	@Autowired
	private NoticeService ns;
	
	
	// 공지사항 관리자 페이지
	@GetMapping("adminBoard/adminNotice")
	public void adminNotice() {

	}
	@RequestMapping(value = "adminBoard/noticeWriteForm" , method = {RequestMethod.GET, RequestMethod.POST})
	public void noticeWriteForm(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
	}
	@RequestMapping(value = "adminBoard/noticeWriteResult", method = {RequestMethod.GET, RequestMethod.POST})
	public void helpInsertResult(Model model, HttpSession session, Notice notice) throws IOException {

		int result = 0;
		String id = (String) session.getAttribute("id");

		String fileName = notice.getFile().getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			UUID uuid = UUID.randomUUID();
			String n_fileName = uuid + fileName.substring(fileName.lastIndexOf("."));
			notice.setN_fileName(n_fileName);
			notice.setId(id);
			System.out.println(notice.getId());
			System.out.println(notice.getN_title());
			System.out.println(notice.getN_content());
			System.out.println(notice.getFile());
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + n_fileName));
			fos.write(notice.getFile().getBytes());
			fos.close();
			result = ns.insert(notice);
		} else {
			result = -1; // 이미 있는 데이터야
		}
		model.addAttribute("id", id);
		model.addAttribute("result", result);
	}
}
