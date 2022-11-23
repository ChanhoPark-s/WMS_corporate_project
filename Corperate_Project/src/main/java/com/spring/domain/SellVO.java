package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SellVO {

	private int no;
	private int member_no;
	private int order_no;
	private String day;
	
	private String name;
	private int client_no;
	private String client_name;
	private String member_name;
	private String item_name;
	private String lot_code;
	
}
