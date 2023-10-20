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
	public int getTotal(Help help) {// 회원별 문의 총 갯수

		return hd.getTotal(help);
	}

	@Override
	public List<Help> list(Help help) {// 회원별 문의 리스트

		return hd.list(help);
	}

	
	public Help select(int hno) {
		
		return hd.select(hno);
	}

	@Override
	public int update(Help help) {
		
		return hd.update(help);
	}

	@Override
	public int delete(int hno) {
		
		return hd.delete(hno);
	}

	@Override
	public int adminGetTotal(Help help) {
		
		return hd.adminGetTotal(help);
	}

	@Override
	public List<Help> adminList(Help help) {
		
		return hd.adminList(help);
	}

	@Override
	public Help selectHelp(int hno) {
		
		return hd.selectHelp(hno);
	}

	@Override
	public int updateHelp(Help help) {
		
		return hd.updateHelp(help);
	}

	@Override
	public int deleteHelp(int hno) {
		
		return hd.deleteHelp(hno);
	}
}
