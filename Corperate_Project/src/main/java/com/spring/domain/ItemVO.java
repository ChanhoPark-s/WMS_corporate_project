package com.spring.domain;

import org.springframework.web.multipart.MultipartFile;

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
	private String client_name;
	
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getGet() {
		return get;
	}
	public void setGet(String get) {
		this.get = get;
	}
	public String getClient_code() {
		return client_code;
	}
	public void setClient_code(String client_code) {
		this.client_code = client_code;
	}
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
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
}
