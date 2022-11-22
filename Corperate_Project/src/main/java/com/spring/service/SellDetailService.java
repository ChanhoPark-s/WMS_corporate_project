package com.spring.service;

import java.util.List;

import com.spring.domain.SellDetailVO;

public interface SellDetailService {

	public void insert(SellDetailVO selldetail);

	public List<SellDetailVO> read();

}
