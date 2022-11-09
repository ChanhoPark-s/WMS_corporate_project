package com.spring.service;

import java.util.List;

import com.spring.domain.DepartmentVO;

public interface DepartmentService {
	
	public List<DepartmentVO> list();
	public int add(DepartmentVO vo);
	public int modify(DepartmentVO vo);
}
