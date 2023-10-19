package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Help;

@Repository
public class HelpDaoImpl implements HelpDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Help help) {// 1:1 문의 사항 입력

		return sst.insert("helpns.insert", help);
	}

	@Override
	public int getTotal(Help help) {//회원별 문의 총 갯수
		System.out.println("id = "+help.getId());
		System.out.println("keyword = "+help.getKeyword());
		System.out.println("search = "+help.getSearch());
		return sst.selectOne("helpns.getTotal", help);
	}

	@Override
	public List<Help> list(Help help) {//회원별 문의 리스트

		return sst.selectList("helpns.list", help);
	}

	@Override
	public Help select(int hno) {
		
		return sst.selectOne("helpns.select",hno);
	}

	@Override
	public int update(Help help) {
		
		return sst.update("helpns.update",help);
	}

	@Override
	public int delete(int hno) {
		
		return sst.delete("helpns.delete",hno);
	}

	@Override
	public int adminGetTotal(Help help) {
		
		return sst.selectOne("helpns.adminGetTotal", help);
	}

	@Override
	public List<Help> adminList(Help help) {
		
		return sst.selectList("helpns.adminList", help);
	}

	@Override
	public Help selectHelp(int hno) {
		
		return sst.selectOne("helpns.selectHelp",hno);
	}

	@Override
	public int updateHelp(Help help) {
		
		return sst.update("helpns.updateHelp", help);
	}

	@Override
	public int deleteHelp(int hno) {
		
		return sst.delete("helpns.deleteHelp",hno);
	}
}
