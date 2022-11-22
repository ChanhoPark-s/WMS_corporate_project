package com.spring.service;

import java.util.List;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.paging.Client_Paging;

public interface SellDetailService {

	public void insert(SellDetailVO selldetail);

	public List<SellDetailVO> read();

	public int getTotalCount(SearchVO searchvo);

	public List<SellDetailVO> selectAll(Client_Paging pageInfo);

}
