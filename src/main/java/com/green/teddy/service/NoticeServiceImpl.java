package com.green.teddy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.green.teddy.dao.NoticeDao;
import com.green.teddy.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nd;
	@Override
	public int insert(Notice notice) {
		return nd.insert(notice);
	}

	
}
