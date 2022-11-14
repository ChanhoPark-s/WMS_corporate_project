package com.spring.service;

import java.util.List;

import com.spring.domain.Input_WareHouseVO;

public interface Input_WareHouseService {
	public List<Input_WareHouseVO> list();
	public int insert(Input_WareHouseVO vo);
}
