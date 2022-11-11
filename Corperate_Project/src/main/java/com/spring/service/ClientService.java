package com.spring.service;

import java.util.ArrayList;
import java.util.Map;

import com.spring.domain.ClientVO;

public interface ClientService {

	public int Insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(String select);
	public ClientVO selectOne(String item_no);
	public int deleteOne(String item_no);
	public int update(ClientVO vO);
	public int getTotalCount(Map map);
	
}
