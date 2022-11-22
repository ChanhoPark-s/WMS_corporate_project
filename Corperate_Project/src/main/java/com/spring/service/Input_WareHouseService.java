package com.spring.service;

import java.util.List;

import com.spring.domain.Init_Input_WareHouseVO;
import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface Input_WareHouseService {
	public List<Input_WareHouseVO> list();
	public int insert(Input_WareHouseVO vo);
	public int getTotalCount(SearchVO searchvo);
	public List<Input_WareHouseVO> getListByPaging(Client_Paging pageInfo);
}
