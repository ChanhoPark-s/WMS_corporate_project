package com.spring.service;

import java.util.List;

import com.spring.domain.ItemVO;

public interface ItemService {
	
	public List<ItemVO> selectAll();
	public void insert(ItemVO vo) throws Exception;
	
}
