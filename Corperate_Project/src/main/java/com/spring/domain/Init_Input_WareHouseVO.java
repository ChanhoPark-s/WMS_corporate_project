package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class Init_Input_WareHouseVO {

	private int no;
	private int member_no;
	private int purchase_sheet_no;
	private int status;
	private List<Init_Input_WareHouse_DetailVO> detail;
	
}