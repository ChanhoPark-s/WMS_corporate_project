package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class OrderSheetVO {

	private int no;
	private String out_day; 			// 납기일자
	private int member_no; 				// 담당자 번호
	private int client_no; 				// 수주처 번호
	
	private ArrayList<Integer> item_no; 	// 품목번호
	private ArrayList<Integer> amount; 	// 품목별 수주개수
}