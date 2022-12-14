package com.spring.service;

import java.util.List;

import com.spring.domain.CellVO;
import com.spring.domain.WareHouseAllAreaVO;

public interface CellService {
	
	public List<CellVO> list();
	public int insert(WareHouseAllAreaVO vo);
	public List<CellVO> getListByRackNo(int no);
	public int deleteCellByNo(String cell_no);
	public WareHouseAllAreaVO selectOneCellByNo(int no);
	public int updateCellByNo(WareHouseAllAreaVO vo);
	public int checkCode(String code);
}
