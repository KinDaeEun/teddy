package com.green.teddy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private Date regdate;
	private String fileName;
	private String m_del;
	// upload용
	private MultipartFile file;

	// paging용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;

	// 비밀번호 찾기
	private int member_auth;

}
