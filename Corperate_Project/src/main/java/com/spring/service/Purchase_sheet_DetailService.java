package com.spring.service;

import java.util.List;

import com.spring.domain.Purchase_sheet_DetailVO;

public interface Purchase_sheet_DetailService {
	
	public List<Purchase_sheet_DetailVO> list();
	public List<Purchase_sheet_DetailVO> selectList(String purchase_sheet_no);
	public int insert(Purchase_sheet_DetailVO vo);
	public int update(Purchase_sheet_DetailVO vo);
	public int delete(int no);
}
