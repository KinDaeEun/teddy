package com.green.teddy.dao;

import com.green.teddy.dto.Member;

public interface MemberDao {
	Member select(String id);
	int insert(Member member);
}
