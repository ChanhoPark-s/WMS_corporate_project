package com.spring.paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	
	int pageNum;
	int amount;
	String whatColumn;
	String keyword;
	
	public Criteria(){
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public Criteria(int pageNum, int amount, String whatColum, String keyword){
		this.pageNum = pageNum;
		this.amount = amount;
		this.whatColumn = whatColum;
		this.keyword = keyword;
	}	
}