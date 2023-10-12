package com.green.teddy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.MemberDao;
import com.green.teddy.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;
	
	public Member select(String id) {
		return md.select(id);
	}
	public int insert(Member member) {
		return md.insert(member);
	}
}
