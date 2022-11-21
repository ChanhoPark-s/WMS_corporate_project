package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LotVO;
import com.spring.mapper.LotRestMapper;

@Service
public class LotRestServiceImpl implements LotRestService{
	
	@Autowired
	private LotRestMapper mapper;

	@Override
	public List<LotVO> getLot(int no) {
		return mapper.getLot(no);
	}
}
