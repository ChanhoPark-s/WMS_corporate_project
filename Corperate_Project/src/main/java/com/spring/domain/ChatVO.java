package com.spring.domain;

import lombok.Data;

@Data
public class ChatVO {
	private int no;
	private String member_id;
	private String member_name;
	private String content;
	private String day;
	
	private String rank_name;
}
