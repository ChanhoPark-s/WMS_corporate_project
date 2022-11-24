package com.spring.service;


public interface CalculationService {

	public int getAllCount(String string);

	public int getTotalMoney(String string);

	public int getCountClient(String string);

	public int getCountMember();

	public int getCountItem();

	/*영업이익 관련된거 수정*/
	public int getTotalSellMoney(); 	// 총매출
	public int getTotalSellOriginalMoney();     // 총매출 - 순이익 = 판매원가
	public int getTotalBenefitMoney();	// 순이익
	public int getTotalBenefitPercent();// 순이익률
}
