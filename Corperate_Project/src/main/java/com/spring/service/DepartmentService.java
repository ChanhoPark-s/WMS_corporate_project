package com.spring.service;

import java.util.List;

import com.spring.domain.DepartmentVO;
import com.spring.domain.SearchVO;

public interface DepartmentService {
	
	public List<DepartmentVO> list();
	public int add(DepartmentVO vo);
	public int modify(DepartmentVO vo);
	public void delete(int no);
	public int getTotalCount(SearchVO vo);
}
