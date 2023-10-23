package com.green.teddy.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import com.green.teddy.dto.Member;

public interface MemberService {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);
	int findIdCheck(String email);
	List<Member> findId(String email);
	int findPwCheck(Member member);
	void findPw(String email, String id) throws MessagingException, UnsupportedEncodingException;

}
