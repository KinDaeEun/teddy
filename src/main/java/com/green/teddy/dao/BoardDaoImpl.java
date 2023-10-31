package com.green.teddy.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int binsert(Board board) {
		return sst.insert("boardns.binsert", board);
	}

	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	public List<Board> blist(Board board) {
		return sst.selectList("boardns.blist", board);
	}

	public Board bselect(int bno) {
		return sst.selectOne("boardns.bselect", bno);
	}

	public void updateBcnt(int bno) {
		sst.update("boardns.updateBcnt", bno);
		
	}

	public int bupdate(Board board) {
		return sst.update("boardns.bupdate", board);
	}

	public int bdelete(int bno) {
		return sst.update("boardns.bdelete", bno);
	}

	public List<Board> bcntlist() {
		return sst.selectList("boardns.bcntlist");
	}

	public int adminGetTotal(Board board) {
		return sst.selectOne("boardns.adminGetTotal", board);
	}

	public List<Board> adminBoardList(Board board) {
		return sst.selectList("boardns.adminBoardList", board);
	}

}
