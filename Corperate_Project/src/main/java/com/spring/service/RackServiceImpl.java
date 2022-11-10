package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.RackVO;
import com.spring.mapper.RackMapper;

@Service
public class RackServiceImpl implements RackService{
	
	@Autowired
	private RackMapper mapper;
	
	@Override
	public List<RackVO> list() {
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
