package com.spring.service;


import java.util.List;

import com.spring.domain.SearchVO;
import com.spring.domain.SellDetailVO;
import com.spring.domain.SellVO;
import com.spring.paging.Client_Paging;

public interface SellService {
	
	public void insert(SellVO sell);
	
	public List<SellVO> read();

	public void delete(int no);

	public void update(SellVO sell);

	public List<SellDetailVO> getSubList(int mainNo);


}
