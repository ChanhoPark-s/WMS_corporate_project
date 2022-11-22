package com.spring.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
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

	@Override
	public LotVO getOne(String code) {
		return mapper.getOne(code);
	}
	
	

}
