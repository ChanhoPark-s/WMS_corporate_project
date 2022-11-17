package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class Input_WareHouseVO {

	private int no;
	private int member_no;
	private int purchase_sheet_no;
	private int status;
	private List<Input_WareHouse_DetailVO> detail;
	
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
