package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.PageDTO;
import com.spring.domain.PageForWareHouseDTO;
import com.spring.domain.SearchVO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.domain.WareHouseMovementVO;
import com.spring.mapper.WareHouseDetailMapper;
import com.spring.paging.Client_Paging;
import com.spring.paging.CriteriaForWareHouse;

@Service
public class WareHouseDetailServiceImpl implements WareHouseDetailService{

	@Autowired
	private WareHouseDetailMapper mapper;
	
	@Override
	public List<WareHouseDetailVO> selectStockByWareNo(WareHouseDetailVO vo) {
		return mapper.selectStockByWareNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByAreaNo(WareHouseDetailVO vo) {
		return mapper.selectStockByAreaNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByRackNo(WareHouseDetailVO vo) {
		return mapper.selectStockByRackNo(vo);
	}

	@Override
	public List<WareHouseDetailVO> selectStockByCellNo(WareHouseDetailVO vo) {
		return mapper.selectStockByCellNo(vo);
	}

	@Override
	public PageDTO<WareHouseDetailVO> getListPage(WareHouseDetailVO vo) {
		
		int totalCount = mapper.getCountAllBySong(vo);
		List<WareHouseDetailVO> list = mapper.getListWithPagingBySong(vo);
		return new PageDTO<WareHouseDetailVO>(totalCount, list, vo);
	}

	@Override
	public WareHouseDetailVO getWare(WareHouseDetailVO vo) {
		return mapper.getWare(vo);
	}

	@Override
	public void update(WareHouseMovementVO vo) {
		mapper.update(vo);
	}

	@Override
	public List<WareHouseMovementVO> itemMovement(Client_Paging pageInfo) {
		return mapper.itemMovement(pageInfo);
	}

	@Override
	public int getTotalCount(SearchVO searchvo) {
		return mapper.getTotalCount(searchvo);
	}

	/* ajax페이징 */
	@Override
	public PageForWareHouseDTO<WareHouseDetailVO> getListPage(CriteriaForWareHouse cri) {

		int totalCount = mapper.getCountAll(cri);
		List<WareHouseDetailVO> list = mapper.getListWithPaging(cri); 
		PageForWareHouseDTO<WareHouseDetailVO> pageDTO = new PageForWareHouseDTO<WareHouseDetailVO>(totalCount, list, cri);
		
		return pageDTO;
	}

	@Override
	public PageForWareHouseDTO<WareHouseDetailVO> getAllListPage(CriteriaForWareHouse cri) {
		
		int totalCount = mapper.getCountWareHouseDetailAll(cri);
		List<WareHouseDetailVO> list = mapper.getWareHouseDetailAllListWithPaging(cri); 
		PageForWareHouseDTO<WareHouseDetailVO> pageDTO = new PageForWareHouseDTO<WareHouseDetailVO>(totalCount, list, cri);
		return pageDTO;
	}
}
