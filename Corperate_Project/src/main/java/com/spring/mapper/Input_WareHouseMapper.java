package com.spring.mapper;

import java.util.List;

import com.spring.domain.Input_WareHouseVO;

public interface Input_WareHouseMapper {
	public List<Input_WareHouseVO> selectAll(); 	
	public int insertMainSheet(Input_WareHouseVO vo);
}
