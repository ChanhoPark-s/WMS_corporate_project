package com.spring.service;

import java.util.List;

import com.spring.domain.AreaVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface AreaService {
	
	public List<AreaVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public int modify(int no);
	public int delete(int no);
	public List<AreaVO> getListByWareNo(int no);
	public int deleteAreaByNo(String area_no);
	public WareHouseAllAreaVO selectOneAreaByNo(int no);
}
