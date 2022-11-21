package com.spring.domain;

import lombok.Data;

@Data
public class Input_WareHouse_DetailVO {
	private int no;
	private int input_WareHouse_No;
	private int purchase_Sheet_Detail_No;
	private int status;
	private String arrival_Date;
	private int qty;
	private int ware_No;
	private int area_No;
	private int rack_No;
	private int cell_No;
	private String lot_Code;
	private int item_No;
	
	
}