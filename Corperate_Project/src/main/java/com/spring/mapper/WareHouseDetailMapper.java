package com.spring.mapper;

import java.util.List;

import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;

public interface WareHouseDetailMapper {

	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo);
	
	/* ajax */
	public int getCountAll(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> getListWithPaging(WareHouseDetailVO vo);
	public WareHouseDetailVO getWare(WareHouseDetailVO vo);
	public void update(WareHouseMovementVO vo);
	public List<WareHouseMovementVO> itemMovement();

}
