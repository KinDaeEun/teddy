package com.green.teddy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.NoticeDao;
import com.green.teddy.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nid;

	@Override
	public int ntGetTotal(Notice notice) {
		
		return nid.ntGetTotal(notice);
	}

	@Override
	public List<Notice> ntList(Notice notice) {
		
		return nid.ntList(notice);
	}

	@Override
	public int ntInsert(Notice notice) {
		
		return nid.ntInsert(notice);
	}

	@Override
	public Notice noSelect(int nno) {
		
		return nid.noSelect(nno);
	}

	@Override
	public int noUpdate(Notice notice) {
		
		return nid.noUpdate(notice);
	}

	@Override
	public int noDelete(int nno) {
		
		return nid.noDelete(nno);
	}

	@Override
	public int nGetTotal(Notice notice) {
	
		return nid.nGetTotal(notice);
	}

	@Override
	public List<Notice> list(Notice notice) {
	
		return nid.list(notice);
	}

	@Override
	public Notice select(int nno) {
		
		return nid.select(nno);
	}

	@Override
	public void updateReadCount(int nno) {
		nid.updateReadCount(nno);
		
	}

}
