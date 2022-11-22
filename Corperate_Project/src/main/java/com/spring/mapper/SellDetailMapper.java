package com.spring.mapper;

import java.util.List;

import com.spring.domain.SellDetailVO;

public interface SellDetailMapper {

	void insert(SellDetailVO selldetail);

	public List<SellDetailVO> read();

}
