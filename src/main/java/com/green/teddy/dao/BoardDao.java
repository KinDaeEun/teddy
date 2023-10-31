package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Board;

public interface BoardDao {

	int binsert(Board board);

	int getTotal(Board board);

	List<Board> blist(Board board);

	Board bselect(int bno);

	void updateBcnt(int bno);

	int bupdate(Board board);

	int bdelete(int bno);

	List<Board> bcntlist();

	int adminGetTotal(Board board);

	List<Board> adminBoardList(Board board);

}
