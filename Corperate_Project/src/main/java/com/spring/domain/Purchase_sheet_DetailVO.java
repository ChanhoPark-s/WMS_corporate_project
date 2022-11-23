package com.spring.domain;

import lombok.Data;

@Data
public class Purchase_sheet_DetailVO {
	
	private int no;
	private int PURCHASE_SHEET_NO;
	private int ORDER_DETAIL_NO;
	private int AMOUNT;
	private int IN_PRICE;
	private int STATUS;
	private int ITEM_NO;
	private int WARE_NO;
	
	//품목이름
	private String ITEM_Name;
	//품목코드
	private String ITEM_Code;
	//창고이름
	private String WARE_Name;
	//합계
	private int total_Price;
	
	
}
