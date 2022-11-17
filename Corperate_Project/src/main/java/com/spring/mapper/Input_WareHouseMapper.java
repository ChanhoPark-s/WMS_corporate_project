package com.spring.mapper;

import java.util.List;

import com.spring.domain.Input_WareHouseVO;
import com.spring.domain.Input_WareHouse_DetailVO;

public interface Input_WareHouseMapper {

	public int inputWarehouse(Input_WareHouseVO vo);

	public int inputWarehouseDetail(List<Input_WareHouse_DetailVO> detail);

}
