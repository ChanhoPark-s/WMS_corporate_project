package com.spring.service;

import java.util.List;

import com.spring.domain.WareHouseVO;

public interface WareHouseService {
	
	public List<WareHouseVO> list();
	public int insert(int no);
	public int modify(int no);
	public int delete(int no);
}
