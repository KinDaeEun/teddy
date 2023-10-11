package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int rno;
	private String id;
	private int cno;
	private String email;
	private String r_addr;
	private String r_model;
	private String country;
	private String center;
	private Date r_date;
	private String r_name;
	private String r_tel;
	private String r_del;
}
