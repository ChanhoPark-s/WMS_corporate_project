package com.spring.paging;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria implements Paging {
	
	private int pageNum;
	private int amount;
	private String whatColumn;
	private String keyword;
	private ArrayList<Integer> main_nos;
	
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

// 해당 페이지의 리스트를 가져올 때 사용하는 기준정보