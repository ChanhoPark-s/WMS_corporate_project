package com.spring.service;

import java.util.List;

import com.spring.domain.RackVO;

public interface RackService {
	
	public List<RackVO> list();
	public int insert(int no);
	public int modify(int no);
	public int delete(int no);
}
