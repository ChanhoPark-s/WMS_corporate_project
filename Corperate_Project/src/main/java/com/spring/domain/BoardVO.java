package com.spring.domain;

import lombok.Data;

@Data
public class BoardVO {
	private int no;
	private String title; 
	private String content; 
	private String w_day;
}