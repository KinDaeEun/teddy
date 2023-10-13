package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.green.teddy.dto.Member;
import com.green.teddy.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bpe;
	
//	login
	@GetMapping("member/loginForm")
	public void loginForm() {}
	@RequestMapping("member/login")
	public void login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null || member2.getM_del().equals("y"))
			result = -1; // 없는 아이디
		// bpe.matches 두개 다 암호와 시키 상태에서 비교하는 메서드
		else if (bpe.matches(member.getPassword(), member2.getPassword())) {
			result = 1; // 성공 id와 암호 일치
			session.setAttribute("id", member.getId());
		}
		model.addAttribute("result", result);
	}
	@GetMapping("member/logout")
	public void logout(HttpSession session) {
		session.invalidate();
	}
// login

// join
	@GetMapping("member/joinForm")
	public void joinform() {
	}
	@PostMapping("member/join")
	public void join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null) {
			String fileName1 = member.getFile().getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + fileName1.substring(fileName1.lastIndexOf("."));
			member.setFileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
			// 암호화
			String encPass = bpe.encode(member.getPassword());
			member.setPassword(encPass);
			result = ms.insert(member);
		} else
			result = -1; // 이미 있는 데이터야
		model.addAttribute("result", result);
	}
	@RequestMapping(value = "/member/idChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문을 전달
	public String idChk(String id, Model model) {
		String msg = "";
		Member member = ms.select(id);
		if (member == null)
			msg = "사용가능한 아이디입니다";
		else
			msg = "이미 사용중인 아이디입니다";
		return msg;
	}
// join
	
}