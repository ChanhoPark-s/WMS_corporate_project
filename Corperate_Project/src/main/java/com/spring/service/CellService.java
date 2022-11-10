package com.spring.service;

import java.util.List;

import com.spring.domain.CellVO;

public interface CellService {
	
	public List<CellVO> list();
	public int insert(int no);
	public int modify(int no);
	public int delete(int no);
}
