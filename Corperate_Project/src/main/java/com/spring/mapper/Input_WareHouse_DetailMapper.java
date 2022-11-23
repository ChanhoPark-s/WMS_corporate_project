package com.spring.mapper;

import java.util.List;

import com.spring.domain.Input_WareHouse_DetailVO;
import com.spring.domain.Purchase_sheetVO;
import com.spring.paging.Criteria;

public interface Input_WareHouse_DetailMapper {
	public List<Input_WareHouse_DetailVO> selectAll();		
	public int insert(Input_WareHouse_DetailVO vo);
	public List<Input_WareHouse_DetailVO> selectSubAllByMainNo(int mainNo);
	public String getLotCode(int no);
	public int createLot(Input_WareHouse_DetailVO vo);
	public List<Input_WareHouse_DetailVO> getListWithPaging(Criteria cri);
	public int getCountAll(Criteria cri);
}
