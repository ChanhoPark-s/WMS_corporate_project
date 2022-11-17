package com.spring.service;

import java.util.List;

import com.spring.domain.WareHouseAllAreaVO;
import com.spring.domain.WareHouseVO;

public interface WareHouseService {
	
	public List<WareHouseVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public int modify(int no);
	public int delete(int no);
	public int deleteWareHouseByNo(String ware_no);
	public WareHouseAllAreaVO selectOneWareHouseByNo(int no);
	public int updateWareHouseByNo(WareHouseAllAreaVO vo);
	public int checkCode(String code);
}
