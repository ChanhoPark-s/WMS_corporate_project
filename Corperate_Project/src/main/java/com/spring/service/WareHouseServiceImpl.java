package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.WareHouseVO;
import com.spring.mapper.WareHouseMapper;

@Service
public class WareHouseServiceImpl implements WareHouseService{
	
	@Autowired
	private WareHouseMapper mapper;
	
	@Override
	public List<WareHouseVO> list() {
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
