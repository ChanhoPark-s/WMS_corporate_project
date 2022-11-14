package com.spring.domain;

import lombok.Data;

@Data
public class RackVO {
	private int no;
	private int area_no;	//랙이 속한 구역일련번호
	private String code;	//랙코드
	private String name;	//랙명
	
}
