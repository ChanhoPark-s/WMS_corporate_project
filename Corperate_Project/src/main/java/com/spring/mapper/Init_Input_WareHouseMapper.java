package com.spring.mapper;

import java.util.List;

import com.spring.domain.Init_Input_WareHouseVO;
import com.spring.domain.Init_Input_WareHouse_DetailVO;

public interface Init_Input_WareHouseMapper {

	public int inputWarehouse(Init_Input_WareHouseVO vo);

	public int inputWarehouseDetail(List<Init_Input_WareHouse_DetailVO> detail);

}
