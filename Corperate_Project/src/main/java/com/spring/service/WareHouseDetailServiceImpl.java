package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
import com.spring.mapper.WareHouseDetailMapper;

@Service
public class WareHouseDetailServiceImpl implements WareHouseDetailService{

	@Autowired
	private WareHouseDetailMapper mapper;
	
	@Override
	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo) {
		return mapper.selectStockByWareNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo) {
		return mapper.selectStockByAreaNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo) {
		return mapper.selectStockByRackNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo) {
		return mapper.selectStockByCellNo(vo);
	}

	@Override
	public PageDTO<WareHouseDetailVO> getListPage(WareHouseDetailVO vo) {
		
		int totalCount = mapper.getCountAll(vo);
		System.out.println(totalCount);
		List<WareHouseDetailVO> list = mapper.getListWithPaging(vo);
		return new PageDTO<WareHouseDetailVO>(totalCount, list, vo);
	}

	@Override
	public WareHouseDetailVO getWare(WareHouseDetailVO vo) {
		return mapper.getWare(vo);
	}

	@Override
	public void update(WareHouseMovementVO vo) {
		mapper.update(vo);
	}

	@Override
	public List<WareHouseMovementVO> itemMovement() {
		return mapper.itemMovement();
	}
}
