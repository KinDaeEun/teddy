package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Help;

public interface HelpDao {

	int insert(Help help);//1:1 문의 사항 입력

	int getTotal(Help help);//회원별 문의 총 갯수

	List<Help> list(Help help);//회원별 문의 리스트

	Help select(int hno);

	int update(Help help);

}
