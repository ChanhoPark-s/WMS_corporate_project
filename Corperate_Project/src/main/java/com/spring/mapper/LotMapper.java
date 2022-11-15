package com.spring.mapper;

import java.util.ArrayList;

import com.spring.domain.LotVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface LotMapper {
	public int getTotalCount(SearchVO searchvo);
	public ArrayList<LotVO> GetAll(Client_Paging pageInfo);
	public int deleteOne(String item_no);
}