package com.spring.domain;

import lombok.Data;

@Data
public class SearchVO {
	private String whatColumn;
	private String keyword;
	private String pageNumber;
	private String item_no;
	private String category;
	private String name;
	
}
