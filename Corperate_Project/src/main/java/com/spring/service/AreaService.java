package com.spring.service;

import java.util.List;

import com.spring.domain.AreaVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface AreaService {
	
	public List<AreaVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public List<AreaVO> getListByWareNo(int no);
	public int deleteAreaByNo(String area_no);
	public WareHouseAllAreaVO selectOneAreaByNo(int no);
	public int updateAreaByNo(WareHouseAllAreaVO vo);
	public int checkCode(String code);
}
