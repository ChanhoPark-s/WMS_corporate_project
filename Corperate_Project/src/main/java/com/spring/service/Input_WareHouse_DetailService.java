package com.spring.service;

import java.util.List;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.paging.Criteria;

public interface Input_WareHouse_DetailService {
	public List<Input_WareHouse_DetailVO> list();
	public int insert(Input_WareHouse_DetailVO vo);
	public List<Input_WareHouse_DetailVO> getSubList(int mainNo);
	/* ajax paging */
	public PageDTO<Input_WareHouse_DetailVO> getListPage(Criteria cri);
}
