package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Car {
	private int cno;
	private String cname;
	private int price;
	private String brand;
	private String c_content;
	private String c_kind;
	private String c_img;
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
	
	//검색용
	private String keyword;
	private String search;
	
	//paging용
	private int startRow; 
	private int endRow; 
}
