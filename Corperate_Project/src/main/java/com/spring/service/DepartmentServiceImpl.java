package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.DepartmentVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.DepartmentMapper;

@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentMapper mapper;
	
	@Override
	public List<DepartmentVO> list(SearchVO vo) {
		return mapper.selectAll(vo);
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
}
