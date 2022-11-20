package com.spring.domain;

import lombok.Data;

@Data
public class WareHouseMovementVO {
	
	private int no;
	private String item_name;
	private String day;
	
	private String ware1;
	private String area1;
	private String rack1;
	private String cell1;
	
	private String ware2;
	private String area2;
	private String rack2;
	private String cell2;
	
	private String lot_code;
	private int qty;
}
