package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Notice;

public interface NoticeService {
   //관리자 공지사항 총 갯수
	int ntGetTotal(Notice notice);

	List<Notice> ntList(Notice notice);

	int ntInsert(Notice notice);

	Notice noSelect(int nno);

	int noUpdate(Notice notice);

	int noDelete(int nno);
    //회원 공지사항 총 갯수
	int getTotal(Notice notice);
	 //회원 공지사항 리스트
	List<Notice> list(Notice notice);

	Notice select(int nno);

	void updateReadCount(int nno);
    

}
