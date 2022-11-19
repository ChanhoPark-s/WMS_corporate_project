package com.spring.service;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ChatVO;
import com.spring.mapper.ChatMapper;


@Service
public class ChatServiceImpl implements ChatService{
 
	@Autowired
	private ChatMapper mapper;

	@Override
	public int insertMsg(ChatVO chatVo) {
		return mapper.insertMsg(chatVo);
	}

	@Override
	public ArrayList<ChatVO> getAllMsg() {
		return mapper.getAllMsg();
	}
	
	
	

	
}
