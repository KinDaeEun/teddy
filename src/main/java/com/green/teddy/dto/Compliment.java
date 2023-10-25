package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Compliment {
	private int cpno;
	private String cp_content;
	private Date cp_date;
	private String cp_del;
	private String id;
	// paging용
	private int startRow;
	private int endRow;
}
