package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Help {
	private int hno;
	private String id;
	private String h_title;
	private String h_content;
	private String h_fileName;
	private Date h_date;
	private String h_del;
}
