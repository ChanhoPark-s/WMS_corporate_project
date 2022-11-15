package com.spring.service;

import java.util.List;

import com.spring.domain.Input_WareHouse_DetailVO;

public interface Input_WareHouse_DetailService {
	public List<Input_WareHouse_DetailVO> list();
	public int insert(Input_WareHouse_DetailVO vo);
}
