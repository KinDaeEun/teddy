package com.green.teddy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class News {
	private int nno;
	private String n_cover_img;
	private String n_img;
	private String n_title;
	private String n_content;
	private String n_writer;
	private Date n_date;
	private String n_del;
	
	//	paging
	private int startRow;
	private int endRow;
	
	//검색용
	private String search;
	private String keyword;
	
	// 이미지
	private MultipartFile n_cover_img_file;
	private MultipartFile n_img_file;
	
}
