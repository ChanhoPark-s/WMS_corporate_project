package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.SearchVO;
import com.spring.mapper.LotMapper;

@Service
public class LotServiceImpl implements LotService{
	
	@Autowired
	private LotMapper mapper;

	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.getTotalCount(searchvo);
	}
	
	

}
