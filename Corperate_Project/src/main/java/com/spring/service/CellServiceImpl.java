package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CellVO;
import com.spring.mapper.CellMapper;

@Service
public class CellServiceImpl implements CellService{
	
	@Autowired
	private CellMapper mapper;
	
	@Override
	public List<CellVO> list() {
		return mapper.selectAll();
	}

	@Override
	public int insert(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
