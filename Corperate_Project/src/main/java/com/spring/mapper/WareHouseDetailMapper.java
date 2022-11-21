package com.spring.mapper;

import java.util.List;

import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
import com.spring.paging.Client_Paging;

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
	
	public List<WareHouseMovementVO> itemMovement(Client_Paging pageInfo);
	public int getTotalCount(SearchVO searchvo);

}
