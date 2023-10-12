package com.green.teddy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	public Member select(String id) {
		return sst.selectOne("memberns.select", id);
	}
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}
}
