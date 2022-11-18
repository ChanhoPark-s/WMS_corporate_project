package com.spring.paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CriteriaForWareHouse {
	
	private int pageNum;
	private int amount;
	private String whatColumn;
	private String keyword;
	
	public CriteriaForWareHouse(){
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public CriteriaForWareHouse(int pageNum, int amount, String whatColum, String keyword){
		this.pageNum = pageNum;
		this.amount = amount;
		this.whatColumn = whatColum;
		this.keyword = keyword;
	}
	
	//창고-셀쪽 정보를 각각가져와서 페이징하기 위한 데이터
		private int ware_no;
		private int area_no;
		private int rack_no;
		private int cell_no;
}

// 해당 페이지의 리스트를 가져올 때 사용하는 기준정보