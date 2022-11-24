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


	/* 이하 영업이익 출력위해 처리하는 4개의 메소드 */
	@Override
	public int getTotalSellMoney() {
		return mapper.getTotalSellMoney();
	}


	@Override
	public int getTotalSellOriginalMoney() {
		return mapper.getTotalSellOriginalMoney();
	}


	@Override
	public int getTotalBenefitMoney() {
		return mapper.getTotalBenefitMoney();
	}


	@Override
	public int getTotalBenefitPercent() {
		return mapper.getTotalBenefitPercent();
	}
	
}
