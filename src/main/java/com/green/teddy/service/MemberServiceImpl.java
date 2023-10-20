package com.green.teddy.service;

import java.util.List;

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
	@Override
	public int update(Member member) {
		return md.update(member);
	}
	@Override
	public int delete(String id) {
		return md.delete(id);
	}
	@Override
	public List<Member> findId(String email){
		return md.findId(email);
	}
	@Override
	public int findIdCheck(String email){
		return md.findIdCheck(email);
	}
	
}
