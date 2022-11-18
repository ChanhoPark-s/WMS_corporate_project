package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.OrderSheetVO;

public interface OrderSheetMapper {
	public int insertMainSheet(OrderSheetVO vo);
	public int insertDetailSheet(
			@Param("mainSheetNo") int mainSheetNo, 
			@Param("itemNo") int itemNo, 
			@Param("itemAmount") int itemAmount);
}
