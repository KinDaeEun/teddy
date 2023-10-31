package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.BoardDao;
import com.green.teddy.dto.Board;
import com.green.teddy.dto.Notice;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bd;

	public int binsert(Board board) {
		return bd.binsert(board);
	}

	public int getTotal(Board board) {
		return bd.getTotal(board);
	}

	public List<Board> blist(Board board) {
		return bd.blist(board);
	}

	public Board bselect(int bno) {
		return bd.bselect(bno);
	}

	public void updateBcnt(int bno) {
		bd.updateBcnt(bno);
		
	}

}
