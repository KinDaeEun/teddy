package com.green.teddy.dto;

import lombok.Data;
import java.sql.*;

@Data
public class Board {
	private int bno;
	private String id;
	private String b_title;
	private String b_writer;
	private String b_content;
	private Date b_date;
	private int b_cnt;
	private String b_del;
	
	//	paging
	private int startRow;
	private int endRow;
	//	search 
	private String search;
	private String keyword;
}
