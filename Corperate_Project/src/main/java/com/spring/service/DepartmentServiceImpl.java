package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.DepartmentVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.DepartmentMapper;
import com.spring.paging.Client_Paging;

@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentMapper mapper;
	
	@Override
	public List<DepartmentVO> list(Client_Paging pageInfo) {
		return mapper.selectAll(pageInfo);
	}
	
	@Override
	public List<DepartmentVO> noSearchList() {
		return mapper.noSearchList();
	}
	
	@Override
	public int add(DepartmentVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int modify(DepartmentVO vo) {
		return mapper.update(vo);
	}

	@Override
	public void delete(int no) {
		mapper.delete(no);
	}

	@Override
	public int getTotalCount(SearchVO vo) {
		return mapper.getTotalCount(vo);
	}

	@Override
	public int selectDelete(String[] parameterValues) {
		return mapper.selectDelete(parameterValues);
	}
}
