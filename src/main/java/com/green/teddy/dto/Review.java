package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int re_no;
	private String id;
	private int cno;
	private int rating;
	private String re_content;
	private Date re_date;
	private String re_del;
	
	// paging
	private int startRow;
	private int endRow;
	
	//검색용
	private String search;
	private String keyword;
}
