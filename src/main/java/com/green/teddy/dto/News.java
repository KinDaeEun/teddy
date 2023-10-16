package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class News {
	private int nno;
	private String n_cover_img;
	private String n_title;
	private String n_content;
	private String n_writer;
	private Date n_date;
	private String n_del;
}
