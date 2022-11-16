package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Purchase_sheetVO;
import com.spring.mapper.Purchase_sheetMapper;

@Service
public class Purchase_sheetServiceImpl implements Purchase_sheetService{

	@Autowired
	private Purchase_sheetMapper mapper;
	
	@Override
	public List<Purchase_sheetVO> list() {
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Purchase_sheetVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int update(Purchase_sheetVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(Purchase_sheetVO vo) {
		return mapper.delete(vo);
	}

	@Override
	public Purchase_sheetVO selectOne(String no) {
		return mapper.selectOne(no);
	}

}
