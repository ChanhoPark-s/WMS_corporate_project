package com.spring.domain;

import java.util.ArrayList;

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
	
	//거래처 이름
	private String client_name;
	//담당자 이름
	private String member_name;
	//품목 이름
	private String item_name;
	//품목 입고가격 총합
	private String totalPrice;
	
	private ArrayList<Integer> item_no; 	// 품목번호
	private ArrayList<Integer> amount; 	// 품목별 수주개수
	private ArrayList<Integer> ware_no; 	// 창고번호
	private ArrayList<Integer> order_detail_no; 	// 수주상세번호
	
}