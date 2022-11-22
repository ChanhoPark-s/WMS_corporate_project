package com.spring.service;

import java.util.List;

import com.spring.domain.DepartmentVO;
import com.spring.domain.SearchVO;
import com.spring.paging.Client_Paging;

public interface DepartmentService {
	
	public List<DepartmentVO> list(Client_Paging pageInfo);
	public int add(DepartmentVO vo);
	public int modify(DepartmentVO vo);
	public void delete(int no);
	public int getTotalCount(SearchVO vo);
	public List<DepartmentVO> noSearchList();
	public int selectDelete(String[] parameterValues);
}
