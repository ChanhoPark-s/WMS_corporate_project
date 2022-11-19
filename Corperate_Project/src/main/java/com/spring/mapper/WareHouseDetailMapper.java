package com.spring.mapper;

import java.util.List;

import com.spring.domain.WareHouseDetailVO;
import com.spring.paging.CriteriaForWareHouse;

public interface WareHouseDetailMapper {

	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo);
	
	/* ajax paging */
	public int getCountAll(CriteriaForWareHouse cri);
	public List<WareHouseDetailVO> getListWithPaging(CriteriaForWareHouse cri);

}
