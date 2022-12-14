package com.spring.domain;

import lombok.Data;

@Data
public class OrderSheetDetailVO {

	private int no;				// 수주서 상세 테이블 레코드 번호
	private int order_no;		// 수주서 번호
	
	private String item_no;		// 품목번호
	private String item_code;	// 품목코드
	private String item_name;	// 품목명
	
	private int amount;			// 수량
	private int in_price;		// 품목 1개의 가격
	private int out_price;		// 품목 1개의 가격
	
	private int client_no;		// 취급처 번호
	private String client_code; // 취급처 코드
	private String client_name;	// 취급처 이름
	
	private int current_amount;	// 현재재고수량
}