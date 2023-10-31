package com.green.teddy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	 private int nno; 
	 private String id;
	 private String n_title;
	 private String n_content;
	 private Date n_date;
	 private String n_fileName;
	 private String n_del;
	 
	//paging용
	private int startRow; 
	private int endRow; 
	
	// upload용
	private MultipartFile file;


}
