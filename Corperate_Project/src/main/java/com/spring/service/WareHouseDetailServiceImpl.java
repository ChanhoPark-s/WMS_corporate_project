package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.WareHouseDetailVO;
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

}
