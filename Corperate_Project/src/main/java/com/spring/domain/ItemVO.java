package com.spring.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ItemVO {
	
	private int no;
	private int client_no;
	private String code;
	private String name;
	private int in_price;
	private int out_price;
	private String image;
	private MultipartFile upload;
	private String client_code;
	private String client_name;
	private String get;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image=upload.getOriginalFilename();//진짜로 이미지 들어가는곳
	}
}
