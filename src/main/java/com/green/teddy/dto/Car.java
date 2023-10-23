package com.green.teddy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Car {
	private int cno;
	private String c_name;
	private int min_price;
	private int max_price;
	private String brand;
	private String c_cover_img;
	private String c_img;
	private String c_content;
	private String c_kind;
	private Date c_date;
	private String engine;
	private String gear;
	private int displacement;
	private String drive_type;
	private String max_output;
	private String suspention;
	private String torque;
	private String brake;
	private String accel;
	private String max_speed;
	private String c_del;
	private int width;
	private int height;
	private int wheelbase;
	private int length;
	private String formt_img;
	private String side_img;
	
	//upload용
	private MultipartFile c_cover_img_file;
	private MultipartFile c_img_file;
	private MultipartFile formt_img_file;
	private MultipartFile side_img_file;
	
	
	//paging용
	private int startRow; 
	private int endRow; 

}
