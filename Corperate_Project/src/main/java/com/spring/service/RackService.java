package com.spring.service;

import java.util.List;

import com.spring.domain.RackVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface RackService {
	
	public List<RackVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public int modify(int no);
	public int delete(int no);
	public List<RackVO> getListByAreaNo(int no);
	public int deleteRackByNo(String rack_no);
	public WareHouseAllAreaVO selectOneRackByNo(int checkno);
	public int updateRackByNo(WareHouseAllAreaVO vo);
}
