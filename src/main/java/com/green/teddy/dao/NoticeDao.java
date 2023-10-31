package com.green.teddy.dao;


import java.util.List;

import com.green.teddy.dto.Notice;

public interface NoticeDao {

	int ntGetTotal(Notice notice);

	List<Notice> ntList(Notice notice);

	int ntInsert(Notice notice);

	Notice noSelect(int nno);

	int noUpdate(Notice notice);

	int noDelete(int nno);

	int getTotal(Notice notice);

	List<Notice> list(Notice notice);

	Notice select(int nno);

	void updateReadCount(int nno);


}
