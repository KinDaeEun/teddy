package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.teddy.dto.Member;
import com.green.teddy.service.MemberService;
import org.slf4j.Logger;

@Controller
public class MemberController {
	@Autowired
	private final MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bpe;

//my page
	@GetMapping("myPage/test")
	public void test() {
	}

	@GetMapping("myPage/myPage_memu")
	public void myPage_memu() {
	}

	// profile
	@RequestMapping("myPage/mypage")
	public void mypage(Member member, Model model, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("id");
		Member member2 = ms.select(id);
		model.addAttribute("member", member2);
	}

//	login
	@GetMapping("member/loginForm")
	public void loginForm() {
	}

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

	// update
	@GetMapping("myPage/updateForm")
	public void updateForm(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
	}

	@PostMapping("member/update")
	public void update(Member member, Model model, HttpSession session) throws IOException {
		String fileName1 = member.getFile().getOriginalFilename();
		if (fileName1 != null && !fileName1.equals("")) {
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + fileName1.substring(fileName1.lastIndexOf("."));
			member.setFileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
		}
		// 암호화
		String encPass = bpe.encode(member.getPassword());
		member.setPassword(encPass);
		// 입력/수정/삭제는 성공한 갯수
		int result = ms.update(member);
		model.addAttribute("result", result);
	}

	// 회원 탈퇴
	@RequestMapping("member/delete")
	public void delete(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		int result = ms.delete(id);
		if (result > 0)
			session.invalidate();
		model.addAttribute("result", result);
	}

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	public MemberController(MemberService ms) {
        this.ms = ms;
    }

	// 아이디 찾기
	@RequestMapping(value = "member/findIdView", method = {RequestMethod.GET, RequestMethod.POST})
	public String findIdView() throws Exception {
		return "/member/findIdView";
	}

	@RequestMapping(value = "member/findId", method = {RequestMethod.GET, RequestMethod.POST} )
    public String findId(Member member, Model model) {
        logger.info("email: " + member.getEmail());
        
        if (ms.findIdCheck(member.getEmail()) == 0) {
            model.addAttribute("msg", "이메일을 확인해주세요");
            return "/member/findIdView";
        } else {
            model.addAttribute("member", ms.findId(member.getEmail()));
            return "/member/findId";
        }
    }
	
	// 비밀번호 찾기
	@RequestMapping(value="member/findPwView" , method=RequestMethod.GET)
	public String findPwView() throws Exception{
		return"/member/findPwView";
	}
	
	@RequestMapping(value="member/findPw", method=RequestMethod.POST)
	public String findPw(Member member,Model model) throws Exception{
		logger.info("password"+member.getId());
		
		if(ms.findPwCheck(member)==0) {
			logger.info("memberPWCheck");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
			
			return "/member/findPwView";
		}else {
	
		ms.findPw(member.getEmail(),member.getId());
		model.addAttribute("member", member.getEmail());
		
		return"/member/findPw";
		}
	}
}
