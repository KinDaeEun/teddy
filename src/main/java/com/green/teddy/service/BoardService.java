package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Board;

public interface BoardService {

	int binsert(Board board);

	int getTotal(Board board);

	List<Board> blist(Board board);

	Board bselect(int bno);

	void updateBcnt(int bno);

}
