package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.RackVO;
import com.spring.domain.WareHouseAllAreaVO;
import com.spring.mapper.RackMapper;

@Service
public class RackServiceImpl implements RackService{
	
	@Autowired
	private RackMapper mapper;
	
	@Override
	public List<RackVO> list() {
		return mapper.selectAll();
	}

	@Override
	public int modify(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RackVO> getListByAreaNo(int no) {
		return mapper.getListByAreaNo(no);
	}

	@Override
	public int deleteRackByNo(String rack_no) {
		return mapper.deleteRackByNo(rack_no);
	}

	@Override
	public int insert(WareHouseAllAreaVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public WareHouseAllAreaVO selectOneRackByNo(int checkno) {
		return mapper.selectOneRackByNo(checkno);
	}

	@Override
	public int updateRackByNo(WareHouseAllAreaVO vo) {
		return mapper.updateRackByNo(vo);
	}

}
