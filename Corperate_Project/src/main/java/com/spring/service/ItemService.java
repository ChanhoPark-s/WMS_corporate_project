package com.spring.service;

import java.util.List;

import com.spring.domain.ClientVO;
import com.spring.domain.ItemVO;
import com.spring.domain.PageDTO;
import com.spring.paging.Criteria;

public interface ItemService {
	
	public List<ItemVO> selectAll();
	public void insert(ItemVO vo) throws Exception;
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo) throws Exception;
		
	/* ajax paging */
	public PageDTO<ItemVO> getListPage(Criteria cri);
 }
