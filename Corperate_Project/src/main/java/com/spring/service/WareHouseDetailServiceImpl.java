package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ClientVO;
import com.spring.domain.PageDTO;
import com.spring.domain.WareHouseDetailVO;
import com.spring.mapper.WareHouseDetailMapper;
import com.spring.paging.Criteria;

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

	/* ajax페이징 */
	@Override
	public PageDTO<WareHouseDetailVO> getListPage(Criteria cri) {
		System.out.println("getListPage 서비스impl에 도달");
		int totalCount = mapper.getCountAll(cri);
		System.out.println("getCountAll 통과totalCount: "+totalCount);
		
		System.out.println("cri어마운트"+cri.getAmount()); 
		System.out.println("cri페이지넘"+cri.getPageNum()); 
		
		
		List<WareHouseDetailVO> list = mapper.getListWithPaging(cri); 
		System.out.println("getListWithPaging 통과list크기는: "+list.size());
		PageDTO<WareHouseDetailVO> pageDTO = new PageDTO<WareHouseDetailVO>(totalCount, list, cri);
		
		return pageDTO;
	}

}
