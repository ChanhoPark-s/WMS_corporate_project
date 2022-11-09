package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.DepartmentVO;
import com.spring.mapper.DepartmentMapper;

@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentMapper mapper;
	
	@Override
	public List<DepartmentVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int add(DepartmentVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int modify(DepartmentVO vo) {
		return mapper.update(vo);
	}

}
