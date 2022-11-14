package com.spring.service;

import java.util.List;

import com.spring.domain.AreaVO;

public interface AreaService {
	
	public List<AreaVO> list();
	public int insert(int no);
	public int modify(int no);
	public int delete(int no);
	public List<AreaVO> getListByWareNo(int no);
}
