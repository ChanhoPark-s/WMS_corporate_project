package com.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CalculationMapper;

@Service
public class CalculationImpl implements CalculationService{
	
	@Autowired
	private CalculationMapper mapper;


	@Override
	public int getAllCount(String string) {
		return mapper.getAllCount(string);
	}


	@Override
	public int getTotalMoney(String string) {
		return mapper.getTotalMoney(string);
	}


	@Override
	public int getCountClient(String string) {
		return mapper.getCountClient(string);
	}


	@Override
	public int getCountMember() {
		return mapper.getCountMember();
	}


	@Override
	public int getCountItem() {
		return mapper.getCountItem();
	}
	
}
