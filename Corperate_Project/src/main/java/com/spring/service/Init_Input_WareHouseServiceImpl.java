package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Init_Input_WareHouseVO;
import com.spring.domain.Init_Input_WareHouse_DetailVO;
import com.spring.mapper.Init_Input_WareHouseMapper;

@Service
public class Init_Input_WareHouseServiceImpl implements Init_Input_WareHouseService{

	@Autowired
	private Init_Input_WareHouseMapper mapper;

	@Override
	public int save(Init_Input_WareHouseVO vo) {
		mapper.inputWarehouse(vo);
		for(Init_Input_WareHouse_DetailVO dvo : vo.getDetail()) {
			dvo.setNo(vo.getNo());
		}
		return mapper.inputWarehouseDetail(vo.getDetail());
	}
}
