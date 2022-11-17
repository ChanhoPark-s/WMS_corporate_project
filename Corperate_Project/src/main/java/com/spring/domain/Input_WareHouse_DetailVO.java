package com.spring.domain;

import lombok.Data;

@Data
public class Input_WareHouse_DetailVO implements Comparable<Input_WareHouse_DetailVO>{

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
	public int compareTo(Input_WareHouse_DetailVO o) {
		return Integer.compare(item_no, o.getItem_no());
	}
	
}

/*
 * 
 *    	입고
 *    
 *    	일련번호			담당자번호			발주서번호			구분
 * 		1				(my)			null			2
 * 
 * 	
 * 		입고상세
 * 		
 * 		일련번호			입고번호			발주서상세번호		구분			입고일자		입고수량			초기창고코드			구역코드			렉코드			셀코드			로트코드			품목코드
 * 		1				1				null			2						(my)
 */
