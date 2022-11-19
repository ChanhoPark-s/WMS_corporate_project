package com.spring.service;

import java.util.ArrayList;

import com.spring.domain.ChatVO;

public interface ChatService {

	public int insertMsg(ChatVO chatVo);

	public ArrayList<ChatVO> getAllMsg();
	
	
}
