package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class OrderSheetVO {

	private int no;
	private int member_no; 				// 담당자 번호
	private String member_name;			// 담당자 이름
	private int client_no; 				// 수주처 번호
	private String client_name;			// 수주처 이름
	private String day; 				// 작성일자
	private String out_day; 			// 납기일자
	private int status;					// 상태 
	
	private int total_price;			// 상세 상품들 출고가 * 수주수량
	private String temp_item_name;		// 수주서 출력시 ㅇㅇ 외 4개 출력을 하기 위한 변수
	private ArrayList<Integer> item_no; // 품목번호
	private ArrayList<Integer> amount; 	// 품목별 수주개수
	
}