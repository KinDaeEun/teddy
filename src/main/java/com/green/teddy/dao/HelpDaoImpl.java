package com.green.teddy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int getTotal(Help help) {

		return sst.selectOne("helpns.getTotal", help);
	}

	@Override
	public List<Help> list(Help help) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sst.selectList("helpns.list", help);
	}//여기까지함
}
