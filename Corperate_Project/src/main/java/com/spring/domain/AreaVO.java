package com.spring.domain;

import lombok.Data;

@Data
public class AreaVO {
	private int no;
	private int ware_no;	//구역이 속한 창고일련번호
	private String code;	//구역코드
	private String name;	//구역명
}
