package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.HelpDao;
import com.green.teddy.dto.Help;

@Service
public class HelpServiceImpl implements HelpService {
	@Autowired
	private HelpDao hd;

	@Override
	public int insert(Help help) { // 1:1 문의 사항 입력
		return hd.insert(help);
	}

	@Override
	public int getTotal(Help help) {

		return hd.getTotal(help);
	}

	@Override
	public List<Help> list(Help help) {

		return hd.list(help);
	}
}
