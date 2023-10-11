package com.green.teddy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private Date regdate;
	private String profile;
	private String m_del;
}
