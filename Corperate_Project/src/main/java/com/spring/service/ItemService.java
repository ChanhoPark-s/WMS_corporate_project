package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.domain.ItemVO;
import com.spring.domain.PageDTO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.Criteria;

public interface ItemService {
	
	public List<ItemVO> selectAll(Client_Paging pageInfo);
	public void insert(ItemVO vo, HttpServletRequest request) throws Exception;
	public void delete(int no);
	public ItemVO selectOne(int no);
	public void update(ItemVO vo, HttpServletRequest request) throws Exception;
	public int getTotalCount(SearchVO searchvo);
	public int code_check(String code);
	
	/* ajax paging */
	public PageDTO<ItemVO> getListPage(Criteria cri);

	/* 판매 페이지 ajax */
	public int getPrice(int no);
 }
