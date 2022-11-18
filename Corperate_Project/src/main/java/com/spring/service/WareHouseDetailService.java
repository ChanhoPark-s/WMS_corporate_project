package com.spring.service;

import java.util.List;

import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.paging.Criteria;

public interface WareHouseDetailService {

	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo);
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo);
	
	/* ajax paging */
	public PageDTO<WareHouseDetailVO> getListPage(Criteria cri);

}
