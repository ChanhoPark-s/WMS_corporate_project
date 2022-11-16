package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.mapper.Input_WareHouseMapper;

@Service
public class Input_WareHouseServiceImpl implements Input_WareHouseService{

	@Autowired
	private Input_WareHouseMapper mapper;
	
	@Override
	public List<Input_WareHouseVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Input_WareHouseVO vo) {
		return mapper.insert(vo);
	}

}
