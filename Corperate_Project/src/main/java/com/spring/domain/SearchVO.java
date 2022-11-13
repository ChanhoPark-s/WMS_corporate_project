package com.spring.domain;

public class SearchVO {
	private String whatColumn;
	private String keyword;
	private String pageNumber;
	private String item_no;
	
	
	public String getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getWhatColumn() {
		return whatColumn;
	}
	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
