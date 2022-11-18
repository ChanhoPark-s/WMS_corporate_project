package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.OrderSheetDetailVO;
import com.spring.domain.OrderSheetVO;

public interface OrderSheetMapper {
	
	/* OrderSheet */
	public int insertMainSheet(OrderSheetVO vo);
	public int insertDetailSheet(
			@Param("mainSheetNo") int mainSheetNo, 
			@Param("itemNo") int itemNo, 
			@Param("itemAmount") int itemAmount);
	public List<OrderSheetVO> selectList();
	
	/* OrderSheetDetail */
	public List<OrderSheetDetailVO> selectSubAllByMainNo(int mainNo);
}



// main은 상위 수주서, sub는 하위 디테일 상품들