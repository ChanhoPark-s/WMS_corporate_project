package com.spring.service;

import java.util.List;

import com.spring.domain.ItemVO;

public interface ItemService {
	
	public List<ItemVO> selectAll();
	public int insert(ItemVO vo);
	
}
