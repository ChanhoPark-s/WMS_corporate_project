package com.spring.mapper;

import java.util.List;

import com.spring.domain.Input_WareHouse_DetailVO;

public interface Input_WareHouse_DetailMapper {
	public List<Input_WareHouse_DetailVO> selectAll();		
	public int insert(Input_WareHouse_DetailVO vo);
}
