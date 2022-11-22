package com.spring.domain;

import com.spring.paging.Paging;

import lombok.Data;

@Data
public class WareHouseDetailVO implements Paging{
	private int no;
	private String lot_code;
	private int amount;
	private int ordered_amount;
	private int item_no;
	private int ware_no;
	private String ware_name;
	private int area_no;
	private String area_name;
	private int rack_no;
	private String rack_name;
	private int cell_no;
	private String cell_name;
	
	
	private int i_no;
	private int client_no;
	private String code;
	private String name;
	private int in_price;
	private int out_price;
	private String image;
	
	private int pageNum;
	private String whatColumn;
	private String keyword;
}
