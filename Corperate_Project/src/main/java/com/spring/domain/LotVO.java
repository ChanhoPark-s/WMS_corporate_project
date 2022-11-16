package com.spring.domain;

import lombok.Data;

@Data
public class LotVO {
	private int no;
	private String code; // Lot코드
	private int item_no; //상품번호
	
	// item 테이블
	private String item_name; // 아이템명
	private int in_price;
	private int out_price;
	private String formattedIn_price;
	private String formattedOut_price;
	private String image;
	// client 테이블
	private int client_no;
	private String client_name;
	private String client_tel;
}
