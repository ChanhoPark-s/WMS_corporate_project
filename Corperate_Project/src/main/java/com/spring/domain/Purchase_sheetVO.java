package com.spring.domain;

import lombok.Data;

@Data
public class Purchase_sheetVO {
	
	private int no;
	private int member_no;
	private int client_no;
	private int order_no;
	private String day;
	private String delivery_date;
	private int status;
	
}
