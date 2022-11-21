package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Input_WareHouseVO {
	private int no;
	private int member_no;
	private int purchase_Sheet_No;
	private int status;
	private int client_no;
	
	private ArrayList<Integer> item_no; 	// 품목번호
	private ArrayList<Integer> QTY; 	// 품목별 수주개수
	private String input_day;
	private int ware_no; 
	private int area_no; 
	private int rack_no; 
	private int cell_no; 
	private int client_name; 
	
}
