package com.spring.domain;

import lombok.Data;

@Data
public class CellVO {
	private int no;
	private int rack_no;	//셀이 속한 랙일련번호
	private String code;	//셀코드
	private String name;	//셀명
	
}
