package com.spring.service;

import java.util.List;

import com.spring.domain.ItemVO;

public interface ItemService {
	
	public List<ItemVO> selectAll();
	public void insert(ItemVO vo) throws Exception;
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo) throws Exception;
	
 }
