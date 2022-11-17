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
	private String ware_Code;
	private String area_Code;
	private String rack_Code;
	private String cell_Code;
	private String lot_Code;
	private String item_Code;
}
