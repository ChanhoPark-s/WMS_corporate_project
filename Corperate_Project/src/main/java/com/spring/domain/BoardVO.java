package com.spring.domain;

public class BoardVO {
	
	private Long bno;			// 게시글 식별자
	private String title;		// 게시글 제목
	
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
