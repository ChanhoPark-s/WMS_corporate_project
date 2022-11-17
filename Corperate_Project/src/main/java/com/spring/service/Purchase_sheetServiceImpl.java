package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ClientVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.mapper.Purchase_sheetMapper;
import com.spring.paging.Criteria;

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

	@Override
	public PageDTO<Purchase_sheetVO> getListPage(Criteria cri) {
		
		int totalCount = mapper.getCountAll(cri);
		List<Purchase_sheetVO> list = mapper.getListWithPaging(cri); 
		PageDTO<Purchase_sheetVO> pageDTO = new PageDTO<Purchase_sheetVO>(totalCount, list, cri);
		
		return pageDTO;
	}

}
