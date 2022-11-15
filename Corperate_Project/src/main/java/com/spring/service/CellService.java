package com.spring.service;

import java.util.List;

import com.spring.domain.CellVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface CellService {
	
	public List<CellVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public int modify(int no);
	public int delete(int no);
	public List<CellVO> getListByRackNo(int no);
	public int deleteCellByNo(String cell_no);
	public WareHouseAllAreaVO selectOneCellByNo(int no);
}
