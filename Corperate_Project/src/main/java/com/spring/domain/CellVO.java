package com.spring.domain;

public class CellVO {
	private int no;
	private int rack_no;	//셀이 속한 랙일련번호
	private String code;	//셀코드
	private String name;	//셀명
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRack_no() {
		return rack_no;
	}
	public void setRack_no(int rack_no) {
		this.rack_no = rack_no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
