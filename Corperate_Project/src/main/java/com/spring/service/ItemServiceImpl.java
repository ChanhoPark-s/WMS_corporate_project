package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ItemVO;
import com.spring.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemMapper mapper;
	
	@Override
	public List<ItemVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int add(ItemVO vo) {
		return mapper.insert(vo);
	}

}
