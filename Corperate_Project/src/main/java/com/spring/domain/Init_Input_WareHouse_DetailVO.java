package com.spring.domain;

import lombok.Data;

@Data
public class Init_Input_WareHouse_DetailVO implements Comparable<Init_Input_WareHouse_DetailVO>{

	private int no;
	private int input_warehouse_no;
	private int purchase_sheet_detail_no;
	private int status;
	private String arrival_date;
	private int qty;
	private String ware_code;
	private String area_code;
	private String rack_code;
	private String cell_code;
	private String lot_code;
	private int item_no;
	
	@Override
	public int compareTo(Init_Input_WareHouse_DetailVO o) {
		return Integer.compare(item_no, o.getItem_no());
	}
	
}
