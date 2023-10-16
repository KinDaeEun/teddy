package com.green.teddy.dao;

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
}
