package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Help;

public interface HelpDao {

	int insert(Help help);//1:1 문의 사항 입력

	int getTotal(Help help);

	List<Help> list(Help help);

}
