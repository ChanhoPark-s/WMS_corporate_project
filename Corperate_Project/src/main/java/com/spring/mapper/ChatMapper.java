package com.spring.mapper;

import java.util.ArrayList;

import com.spring.domain.ChatVO;

public interface ChatMapper {

	public int insertChat(ChatVO chatvo);
	public ArrayList<ChatVO> getAllContent();
}