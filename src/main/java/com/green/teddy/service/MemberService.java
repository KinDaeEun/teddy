package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Member;

public interface MemberService {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);
	int findIdCheck(String email);
	List<Member> findId(String email);

}
