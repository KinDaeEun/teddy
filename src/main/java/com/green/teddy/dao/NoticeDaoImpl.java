package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int ntGetTotal(Notice notice) {

		return sst.selectOne("boardns.ntGetTotal", notice);
	}

	@Override
	public List<Notice> ntList(Notice notice) {
		return sst.selectList("boardns.ntList", notice);
	}

	@Override
	public int ntInsert(Notice notice) {
		System.out.println("1 = " + notice.getId());
		return sst.insert("boardns.ntInsert", notice);
	}

	@Override
	public Notice noSelect(int nno) {

		return sst.selectOne("boardns.noSelect", nno);
	}

	@Override
	public int noUpdate(Notice notice) {

		return sst.update("boardns.noUpdate", notice);
	}

	@Override
	public int noDelete(int nno) {

		return sst.delete("boardns.noDelete", nno);
	}

	@Override
	public int getTotal(Notice notice) {

		return sst.selectOne("boardns.getTotal", notice);
	}

	@Override
	public List<Notice> list(Notice notice) {

		return sst.selectList("boardns.list", notice);
	}

	@Override
	public Notice select(int nno) {

		return sst.selectOne("boardns.select", nno);
	}

	@Override
	public void updateReadCount(int nno) {
		sst.update("boardns.updateReadCount", nno);

	}
}
