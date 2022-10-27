package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;			// 게시글 식별자
	private String title;		// 게시글 제목
	private String content;		// 게시글 내용
	private String writer;		// 게시글 작성자
	private Date regdate;		// 게시글 등록시간
	private Date updateDate;	// 게시글 수정시간
}
