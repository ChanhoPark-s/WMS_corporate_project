package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Purchase_sheetVO {
	
	private int no;
	private int member_no;
	private int client_no;
	private int dep_no;
	//수주서 번호
	private String order_no;
	private String day;
	private String delivery_date;
	private int status;
	
	//거래처 이름
	private String client_name;
	private String client_code;
	//담당자 이름
	private String member_name;
	private String dep_name;
	private String dep_code;
	//품목 이름
	private String item_name;
	private String temp_item_name;
	//품목 입고가격 총합
	private String totalPrice;
	//품목 입고가격 총합
	private String totalAmount;
	
	private ArrayList<Integer> item_no; 	// 품목번호
	private ArrayList<Integer> amount; 	// 품목별 수주개수
	private ArrayList<Integer> ware_no; 	// 창고번호
	private ArrayList<String> detail_no; 	// 수주상세번호
	
}