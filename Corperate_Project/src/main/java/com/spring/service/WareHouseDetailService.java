package com.spring.service;

import java.util.List;

import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;

public interface WareHouseDetailService {

	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo);
	
	/* ajax */
	public PageDTO<WareHouseDetailVO> getListPage(WareHouseDetailVO vo);
	public WareHouseDetailVO getWare(WareHouseDetailVO vo);
	public void update(WareHouseMovementVO vo);
	
	public List<WareHouseMovementVO> itemMovement();

}
