package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CellVO;
import com.spring.domain.WareHouseAllAreaVO;
import com.spring.mapper.CellMapper;

@Service
public class CellServiceImpl implements CellService{
	
	@Autowired
	private CellMapper mapper;
	
	@Override
	public List<CellVO> list() {
		return mapper.selectAll();
	}

	@Override
	public List<CellVO> getListByRackNo(int no) {
		return mapper.getListByRackNo(no);
	}

	@Override
	public int deleteCellByNo(String cell_no) {
		return mapper.deleteCellByNo(cell_no);
	}

	@Override
	public int insert(WareHouseAllAreaVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public WareHouseAllAreaVO selectOneCellByNo(int no) {
		return mapper.selectOneCellByNo(no);
	}

	@Override
	public int updateCellByNo(WareHouseAllAreaVO vo) {
		return mapper.updateCellByNo(vo);
	}

	@Override
	public int checkCode(String code) {
		return mapper.checkCode(code);
	}

}
