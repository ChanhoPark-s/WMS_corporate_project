package com.spring.service;

import java.util.ArrayList;

import com.spring.domain.ClientVO;

public interface ClientService {

	public int Insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(String select);
	
}
