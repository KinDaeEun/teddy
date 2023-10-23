package com.green.teddy.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import com.green.teddy.dao.MemberDao;
import com.green.teddy.dto.MailUtils;
import com.green.teddy.dto.Member;
import com.green.teddy.dto.TempKey;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;
	@Autowired
	private JavaMailSender mailSender;

	public Member select(String id) {
		return md.select(id);
	}

	public int insert(Member member) {
		return md.insert(member);
	}

	@Override
	public int update(Member member) {
		return md.update(member);
	}

	@Override
	public int delete(String id) {
		return md.delete(id);
	}

	@Override
	public List<Member> findId(String email) {
		return md.findId(email);
	}

	@Override
	public int findIdCheck(String email) {
		return md.findIdCheck(email);
	}

	@Override
	public int findPwCheck(Member member) {
		return md.findPwCheck(member);
	}

	@Override
	public void findPw(String email,String id) throws MessagingException, UnsupportedEncodingException{
		String memberKey = new TempKey().getKey(6,false);
		String password = BCrypt.hashpw(memberKey,BCrypt.gensalt());
		md.findPw(email,id,password);
		 
		MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[Teddy 임시 비밀번호 입니다.]"); //메일제목
			sendMail.setText(
					"<h1>임시비밀번호 발급</h1>" +
							"<br/>"+id+"님 "+
							"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
							"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
							"<br/>로그인 후 비밀번호 변경을 해주세요.");
			sendMail.setFrom("yangka04@naver.com"); //본인 메일 작성
			sendMail.setTo(email);
			sendMail.send();
	}

}
