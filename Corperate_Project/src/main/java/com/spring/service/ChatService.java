package com.spring.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.spring.domain.ChatVO;

public interface ChatService {

	public int insertChat(ChatVO chatvo);

	public ArrayList<ChatVO> getAllContent();

}
