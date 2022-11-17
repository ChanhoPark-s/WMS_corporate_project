package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.mapper.Input_WareHouseMapper;

@Service
public class Input_WareHouseServiceImpl implements Input_WareHouseService{

	@Autowired
	private Input_WareHouseMapper mapper;

	@Override
	public int save(Input_WareHouseVO vo) {
		mapper.inputWarehouse(vo);
		for(Input_WareHouse_DetailVO dvo : vo.getDetail()) {
			dvo.setNo(vo.getNo());
		}
		return mapper.inputWarehouseDetail(vo.getDetail());
	}
}
