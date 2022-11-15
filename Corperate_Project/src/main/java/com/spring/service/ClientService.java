package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.domain.ClientVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface ClientService {

	public int Insert(ClientVO vo);
	public ArrayList<ClientVO> GetAll(Client_Paging pageInfo);
	public ClientVO selectOne(String item_no);
	public int deleteOne(String item_no);
	public int update(ClientVO vO);
	public int getTotalCount(SearchVO searchvo);
	public List<ClientVO> GetAllClient();
	
}
