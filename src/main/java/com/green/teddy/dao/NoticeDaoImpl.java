package com.green.teddy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int insert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}
}
