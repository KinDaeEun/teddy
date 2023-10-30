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

	@Override
	public int insert(Board board) {
		return bd.insert(board);
	}


}
