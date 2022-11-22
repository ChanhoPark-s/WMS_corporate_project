package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class OrderSheetVO {

	private int no;
	private String day; 				// 작성일자
	private String out_day; 			// 납기일자
	private int status;					// 상태
	
	private int member_no; 				// 담당자 번호
	private String member_name;			// 담당자 이름
	
	private int dep_no;					// 부서 번호
	private String dep_code;			// 부서 코드
	private String dep_name;			// 부서 이름
	
	private int client_no; 				// 수주처 번호
	private String client_code;			// 수주처 코드
	private String client_name;			// 수주처 이름
	
	private int rank_no;				// 직급 번호
	private String rank_code;			// 직급 코드
	private String rank_name;			// 직급 이름
	
	private int total_price;			// 상세 상품들 출고가 * 수주수량
	private String temp_item_name;		// 수주서 출력시 ㅇㅇ 외 4개 출력을 하기 위한 변수
	private ArrayList<Integer> item_no; // 품목번호
	private ArrayList<Integer> amount; 	// 품목별 수주개수
	
//ajax페이징 sql위한 변수
	
	private String itemNo;			// 번호 ex) 1, 2, 3
	private String item_Code;			// 코드 ex) 12, 34, A1
	private String itme_client_no;			// 하나 ex) 한화, 삼성, 엘쥐
	private String in_price;			// 가격 ex) 1000, 2000, 3000
	private String totalAmount;			// 수량 ex) 1, 2, 3
	
}