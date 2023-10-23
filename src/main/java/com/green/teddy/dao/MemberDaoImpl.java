package com.green.teddy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	@Override
	public int delete(String id) {
		return sst.delete("memberns.update", id);
	}
	@Override
	public List<Member> findId(String email){
		return sst.selectList("memberns.findId", email);
	}
	
	@Override
	public int findIdCheck(String email){
		return sst.selectOne("memberns.findIdCheck", email);
	}
	@Override

	public int adminMbTotal(Member member) {
	
		return sst.selectOne("memberns.adminMbTotal", member);
	}
	@Override
	public List<Member> mbList(Member member) {
		
		return sst.selectList("memberns.mbList", member);
	}
	@Override
	public int deleteAdmin(String id) {
		
		return sst.delete("memberns.deleteAdmin", id);
	}

	public int findPwCheck(Member member){
	return sst.selectOne("memberns.findPwCheck", member);	
	}
	@Override
	public int findPw(String email, String id, String password) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("id", id);
		map.put("password", password);
		return sst.update("memberns.findPw", map);
	}


}
