package com.spring.mapper;

import java.util.ArrayList;

import com.spring.domain.ChatVO;

public interface ChatMapper {
	
	public ArrayList<ChatVO> getAllMsg();
	public int insertMsg(ChatVO chatVo);
}