package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Input_WareHouseVO {
	private int no;
	private int member_No;
	private int purchase_Sheet_No;
	private int status;
	
	private ArrayList<Integer> item_no; 	// 품목번호
	private ArrayList<Integer> QTY; 	// 품목별 수주개수
	private String input_day;
	private String ware_no; 
	private String area_no; 
	private String rack_no; 
	private String cell_no; 
}
