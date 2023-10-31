package com.green.teddy.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class Notice {
	private int nno;
	private String id;
	private String n_title;
	private String n_content;
	private Date n_date;
	private int n_cnt;
	private String n_del;

	// paging용
	private int startRow;
	private int endRow;

	// 검색용
	private String search;
	private String keyword;
}
      