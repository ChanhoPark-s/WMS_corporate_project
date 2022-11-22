package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.mapper.Input_WareHouse_DetailMapper;

@Service
public class Input_WareHouse_DetailServiceImpl implements Input_WareHouse_DetailService{
	@Autowired
	private Input_WareHouse_DetailMapper mapper;
	
	@Override
	public List<Input_WareHouse_DetailVO> list() { 
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Input_WareHouse_DetailVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<Input_WareHouse_DetailVO> getSubList(int mainNo) {
		return mapper.selectSubAllByMainNo(mainNo);
	}
}
