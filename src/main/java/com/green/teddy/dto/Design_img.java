package com.green.teddy.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Design_img {
	private int dno;
	private String img_name;
	private int cno;
	
	private MultipartFile img_file;
	

}
