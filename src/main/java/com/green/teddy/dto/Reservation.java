package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int rno;
	private String id;
	private String r_name;
	private String email;
	private String r_tel;
	private String r_date;
	private String r_del;
	//	차량 브랜드, 모델
	private String brand;
	private String c_name;
	//	도시, 구, 전시장 위치
	private String find_city;
	private String find_gu;
	private String find_center;
	
	public String tostring() {
		return id+email+r_tel+r_date;
	}

}
