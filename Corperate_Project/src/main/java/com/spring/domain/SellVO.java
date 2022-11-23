package com.spring.domain;


import lombok.Data;

@Data
public class SellVO {

	private int no;
	private int member_no;
	private int order_no;
	private String day;
	private int client_no;
	
	private String name;
	private String temp_item_name;
	private String client_name;
	
}
