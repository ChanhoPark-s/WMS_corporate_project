package com.spring.mapper;

import java.util.List;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.paging.Client_Paging;

public interface SellDetailMapper {

	void insert(SellDetailVO selldetail);

	public List<SellDetailVO> read();

	public List<SellDetailVO> selectAll(Client_Paging pageInfo);
	
	public int getTotalCount(SearchVO searchvo);
}
