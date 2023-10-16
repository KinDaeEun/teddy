package com.green.teddy.service;

import com.green.teddy.dto.Member;

public interface MemberService {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);

}
