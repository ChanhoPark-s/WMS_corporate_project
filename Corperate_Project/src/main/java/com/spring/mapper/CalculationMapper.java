package com.spring.mapper;


public interface CalculationMapper {
	
	public int getAllCount(String string);

	public int getTotalMoney(String string);

	public int getCountClient(String string);

	public int getCountMember();

	public int getCountItem();
}