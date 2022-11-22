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
	public int insertChat(ChatVO chatvo) {
		return mapper.insertChat(chatvo);
	}

	@Override
	public ArrayList<ChatVO> getAllContent() {
		return mapper.getAllContent();
	}

	
}
