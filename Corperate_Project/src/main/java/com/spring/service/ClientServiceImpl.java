package com.spring.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ClientVO;
import com.spring.mapper.ClientMapper;

@Service
public class ClientServiceImpl implements ClientService{
 
	@Autowired
	private ClientMapper mapper;
	

	@Override 
	public int Insert(ClientVO vo) {
		return mapper.insert(vo);
	}


	@Override
	public ArrayList<ClientVO> GetAll(String select) {
		return mapper.GetAll(select);
	}

}
