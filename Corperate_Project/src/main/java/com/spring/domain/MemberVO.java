package com.spring.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {

	private int no;
	private String id;
	private String pw;
	private String name;
	private int dep_no;
	private String dep_code;
	private String dep_name;
	private int rank_no;
	private String rank_code;
	private String rank_name;
	private String email;
	private MultipartFile image;
	private String fileName;
	private String reg_date;
	
}
