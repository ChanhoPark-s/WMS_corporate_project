package com.spring.service;

import java.util.List;

import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.paging.Criteria;

public interface Purchase_sheetService {
	
	public List<Purchase_sheetVO> list();
	public int insert(Purchase_sheetVO vo);
	public int update(Purchase_sheetVO vo);
	public int delete(Purchase_sheetVO vo);
	public Purchase_sheetVO selectOne(String no);
	
	/* ajax paging */
	public PageDTO<Purchase_sheetVO> getListPage(Criteria cri);
}
