package com.spring.domain;

import lombok.Data;

@Data
public class WareHouseDetailVO {
	private int no;
	private String lot_code;
	private int amount;
	private int ordered_amount;
	private int item_no;
	private int ware_no;
	private int area_no;
	private int rack_no;
	private int cell_no;
	
	private int i_no;
	private int client_no;
	private String code;
	private String name;
	private int in_price;
	private int out_price;
	private String image;
}
