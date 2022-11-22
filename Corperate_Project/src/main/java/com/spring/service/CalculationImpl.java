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
	
}
