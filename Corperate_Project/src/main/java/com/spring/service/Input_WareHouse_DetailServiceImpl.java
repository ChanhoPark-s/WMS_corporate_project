package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.PageDTO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.mapper.Input_WareHouse_DetailMapper;
import com.spring.paging.Criteria;

@Service
public class Input_WareHouse_DetailServiceImpl implements Input_WareHouse_DetailService{
	@Autowired
	private Input_WareHouse_DetailMapper mapper;
	
	@Override
	public List<Input_WareHouse_DetailVO> list() { 
		return mapper.selectAll();
	}	
	
	@Override
	public int insert(Input_WareHouse_DetailVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<Input_WareHouse_DetailVO> getSubList(int mainNo) {
		return mapper.selectSubAllByMainNo(mainNo);
	}
	
	@Override
	public List<Input_WareHouse_DetailVO> getSubList2(int mainNo) {
		return mapper.selectSubAllByPurchaseNo(mainNo);
	}

	@Override
	public PageDTO<Input_WareHouse_DetailVO> getListPage(Criteria cri) {
		
		int totalCount = mapper.getCountAll(cri);
		List<Input_WareHouse_DetailVO> list = mapper.getListWithPaging(cri); 
		PageDTO<Input_WareHouse_DetailVO> pageDTO = new PageDTO<Input_WareHouse_DetailVO>(totalCount, list, cri);
		
		return pageDTO;
	}
}
