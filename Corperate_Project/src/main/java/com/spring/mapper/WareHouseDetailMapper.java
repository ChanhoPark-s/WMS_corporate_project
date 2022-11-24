package com.spring.mapper;

import java.util.List;

import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
import com.spring.paging.Client_Paging;
import com.spring.paging.CriteriaForWareHouse;

public interface WareHouseDetailMapper {

	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo);
	
	// song
	public int getCountAllBySong(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> getListWithPagingBySong(WareHouseDetailVO vo);
	public WareHouseDetailVO getWare(WareHouseDetailVO vo);
	public void update(WareHouseMovementVO vo);
	public List<WareHouseMovementVO> itemMovement(Client_Paging pageInfo);
	public int getTotalCount(SearchVO searchvo);
	
	/* ajax paging */
	public int getCountAll(CriteriaForWareHouse cri);
	public List<WareHouseDetailVO> getListWithPaging(CriteriaForWareHouse cri);
	public int getCountWareHouseDetailAll(CriteriaForWareHouse cri);
	public List<WareHouseDetailVO> getWareHouseDetailAllListWithPaging(CriteriaForWareHouse cri);
	
	//
	public List<WareHouseDetailVO> getWareDetail(String code);
	

}
