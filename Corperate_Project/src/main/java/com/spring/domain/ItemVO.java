package com.spring.domain;

import org.springframework.web.multipart.MultipartFile;

public class ItemVO {
	int no;
	int client_no;
	String code;
	String name;
	int in_price;
	int out_price;
	String image;
	MultipartFile upload;	
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image=upload.getOriginalFilename();//진짜로 이미지 들어가는곳
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getClient_no() {
		return client_no;
	}
	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIn_price() {
		return in_price;
	}
	public void setIn_price(int in_price) {
		this.in_price = in_price;
	}
	public int getOut_price() {
		return out_price;
	}
	public void setOut_price(int out_price) {
		this.out_price = out_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
