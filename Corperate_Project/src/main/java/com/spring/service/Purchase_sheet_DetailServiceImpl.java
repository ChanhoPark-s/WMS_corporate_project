package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Purchase_sheet_DetailVO;
import com.spring.mapper.Purchase_sheet_DetailMapper;

@Service
public class Purchase_sheet_DetailServiceImpl implements Purchase_sheet_DetailService{

	@Autowired
	private Purchase_sheet_DetailMapper mapper;
	
	@Override
	public List<Purchase_sheet_DetailVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Purchase_sheet_DetailVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int update(Purchase_sheet_DetailVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

	@Override
	public List<Purchase_sheet_DetailVO> selectList(String purchase_sheet_no) {
		return mapper.selectList(purchase_sheet_no);
	}

}
