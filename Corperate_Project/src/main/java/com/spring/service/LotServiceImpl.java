package com.spring.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LotVO;
import com.spring.domain.SearchVO;
import com.spring.mapper.LotMapper;
import com.spring.paging.Client_Paging;

@Service
public class LotServiceImpl implements LotService{
	
	@Autowired
	private LotMapper mapper;

	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.getTotalCount(searchvo);
	}

	@Override
	public ArrayList<LotVO> GetAll(Client_Paging pageInfo) {
		return mapper.GetAll(pageInfo);
	}

	@Override
	public int deleteOne(String item_no) {
		return mapper.deleteOne(item_no);
	}
	
	

}
