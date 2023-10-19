package com.green.teddy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String h_ref;
	private String r_content;
	// upload용
	private MultipartFile file;
	//paging용
    private int startRow;
    private int endRow;
    //검색용
    private String search;
    private String keyword;
}
