package com.spring.mapper;


public interface CalculationMapper {
	
	public int getAllCount(String string);

	public int getTotalMoney(String string);

	public int getCountClient(String string);

	public int getCountMember();

	public int getCountItem();
	
	/* 이하 영업이익 출력위해 처리하는 4개의 메소드 */
	public int getTotalSellMoney(); 	// 총매출
	public int getTotalSellOriginalMoney();     // 총매출 - 순이익 = 판매원가
	public int getTotalBenefitMoney();	// 순이익
	public int getTotalBenefitPercent();// 순이익률
}