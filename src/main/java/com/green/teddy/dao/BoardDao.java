package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Board;

public interface BoardDao {

	int binsert(Board board);

	int getTotal(Board board);

	List<Board> blist(Board board);

	Board bselect(int bno);

	void updateBcnt(int bno);

}
