package com.spring.service;


import java.util.List;

import com.spring.domain.SellVO;

public interface SellService {
	
	public void insert(SellVO sell);
	
	public List<SellVO> read();

	public void delete(int no);

	public void update(SellVO sell);
 

}
