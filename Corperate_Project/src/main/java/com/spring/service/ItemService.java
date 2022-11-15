package com.spring.service;

import java.util.List;

import com.spring.domain.ItemVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface ItemService {
	
	public List<ItemVO> selectAll(Client_Paging pageInfo);
	public void insert(ItemVO vo) throws Exception;
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo) throws Exception;
	public int getTotalCount(SearchVO searchvo);
	
 }
