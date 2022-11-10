package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.AreaVO;
import com.spring.mapper.AreaMapper;

@Service
public class AreaServiceImpl implements AreaService{
	
	@Autowired
	private AreaMapper mapper;
	
	@Override
	public List<AreaVO> list() {
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
