package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Member;

public interface MemberDao {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);
	List<Member> findId(String email);
	int findIdCheck(String email);
	int adminMbTotal(Member member);
	List<Member> mbList(Member member);
	int deleteAdmin(String id);
}
